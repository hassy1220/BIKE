class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached:profile_image
  has_many:post_bikes,dependent: :destroy
  has_many:post_bike_comments,dependent: :destroy
  has_many:favorites,dependent: :destroy
  has_many:follow,class_name: "Relationship",foreign_key: "followed_id" ,dependent: :destroy
  has_many:followed,class_name: "Relationship" ,foreign_key: "follow_id" ,dependent: :destroy
  # その人がフォローした人達一覧
  has_many:followeds,through: :follow,source: :follow
  # その人がフォローされた人達一覧
  has_many:follows,through: :followed,source: :followed

  has_many:room_users,dependent: :destroy
  has_many:rooms,through: :room_users
  has_many:chats,dependent: :destroy

  def get_profile_image(width,height)
    unless profile_image.attached?
      file_path = Rails.root.join("app/assets/images/no-image-icon.jpg")
      profile_image.attach(io:File.open(file_path),filename:"default-image.jpg",content_type:"image/jpg")
    end
      profile_image.variant(resize_to_limit:[width,height]).processed
  end
end
