class CreateUnicorns < ActiveRecord::Migration[6.1]
  def change
    create_table :unicorns do |t|
      t.string :name
      t.string :age
      t.string :color
      t.string :personality
      t.string :quirks

      t.timestamps
    end
  end
end
