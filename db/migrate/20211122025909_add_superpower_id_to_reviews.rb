class AddSuperpowerIdToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :superpower_id, :integer
  end
end
