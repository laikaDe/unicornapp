class AddUnicornIdToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :unicorn_id, :integer
  end
end
