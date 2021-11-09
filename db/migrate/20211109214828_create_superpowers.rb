class CreateSuperpowers < ActiveRecord::Migration[6.1]
  def change
    create_table :superpowers do |t|
      t.string :type
      t.text :description

      t.timestamps
    end
  end
end
