class PostBike < ApplicationRecord
  is_impressionable counter_cache: true
  belongs_to:user
  has_many:post_tags,dependent: :destroy
  has_many:tags,through: :post_tags

  has_many:post_bike_comments,dependent: :destroy

  has_many:favorites,dependent: :destroy
  has_many:likes,through: :favorites,source: :user

  has_one_attached:bike_image

  def get_bike_image(width,height)
    unless bike_image.attached?
      file_path = Rails.root.join("app/assets/images/no_image.jpg")
      bike_image.attach(io:File.open(file_path),filename:"default-image.jpg",content_type:"image/jpg")
    end
      bike_image.variant(resize_to_limit:[width,height]).processed
  end
  def get_maker(number)
    maker=["ホンダ","スズキ","ヤマハ","KTM","ハーレー"]
    maker[number]
  end
  def get_engine(number)
    engine=["~50cc","50~125cc","125~250cc","250~400cc","400cc~"]
    engine[number]
  end
end
