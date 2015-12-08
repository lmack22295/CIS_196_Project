class Event < ActiveRecord::Base	
  has_many :events_users, dependent: :destroy
  has_many :users, through: :events_users
  belongs_to :admin, class_name: "User"

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :time, presence: true
  validates :time, length: { minimum: 2 }
  validates :description, presence: true
end
