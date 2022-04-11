class AddImpressionsCountToPostBikes < ActiveRecord::Migration[6.1]
  def change
    add_column :post_bikes, :impressions_count, :integer,default: 0
  end
end
