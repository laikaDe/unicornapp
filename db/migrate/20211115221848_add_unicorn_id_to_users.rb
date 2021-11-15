class AddUnicornIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :unicorn_id, :integer
  end
end
