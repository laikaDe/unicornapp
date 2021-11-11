class AddUnicornIdToSuperpowers < ActiveRecord::Migration[6.1]
  def change
    add_column :superpowers, :unicorn_id, :integer
  end
end
