class AddUserIdToSuperpowers < ActiveRecord::Migration[6.1]
  def change
    add_column :superpowers, :user_id, :integer
  end
end
