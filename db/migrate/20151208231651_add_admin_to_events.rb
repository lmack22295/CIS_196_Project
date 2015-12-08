class AddAdminToEvents < ActiveRecord::Migration
  def change
    add_reference(:events, :admin)
  end
end
