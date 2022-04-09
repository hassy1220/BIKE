class CreatePostBikeComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_bike_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :post_bike_id

      t.timestamps
    end
  end
end
