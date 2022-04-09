class FavoritesController < ApplicationController
  def create
    post_bike = PostBike.find(params[:post_bike_id])
    unless post_bike.likes.exists?(id: current_user.id)
     favorite = Favorite.new
     favorite.user_id = current_user.id
     favorite.post_bike_id = post_bike.id
     favorite.save
    end
    redirect_to post_bikes_path
  end
  def destroy
    post_bike = PostBike.find(params[:post_bike_id])
    if post_bike.likes.exists?(id: current_user.id)
      favorite = Favorite.find_by(user_id: current_user.id,post_bike_id: post_bike.id)
      favorite.destroy
    end
    redirect_to post_bikes_path
  end
end
