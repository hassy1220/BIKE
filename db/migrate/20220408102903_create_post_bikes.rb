class CreatePostBikes < ActiveRecord::Migration[6.1]
  def change
    create_table :post_bikes do |t|
      t.integer :user_id
      t.string :name
      t.text :opinion
      t.integer :engine
      t.integer :maker
      t.string :category
      t.timestamps
    end
  end
end
