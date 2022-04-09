class PostBikeCommentsController < ApplicationController
  def create
    @post_bike = PostBike.find(params[:post_bike_id])
    @post_bike_comment = PostBikeComment.new(comment_params)
    @post_bike_comment.user_id = current_user.id
    @post_bike_comment.post_bike_id = @post_bike.id
    @post_bike_comment.save
    redirect_to request.referer
  end
  private
  def comment_params
    params.require(:post_bike_comment).permit(:comment)
  end
end
