class User < ActiveRecord::Base	
  has_many :events_users, dependent: :destroy
  has_many :events, through: :events_users

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { minimum: 2 }
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true
  validates :password, length: { minimum: 4 }

  include BCrypt

  def password
    @password ||= Password.new(password_hash) if password_hash
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  private

  def name_capitalize
    errors.add(:name, 'name is not capitalized') if name.capitalize != name
  end
end
