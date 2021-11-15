class RemoveUnicornIdFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :unicorn_id, :integer
  end
end
