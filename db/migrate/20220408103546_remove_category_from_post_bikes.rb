class RemoveCategoryFromPostBikes < ActiveRecord::Migration[6.1]
  def change
    remove_column :post_bikes, :category, :string
  end
end
