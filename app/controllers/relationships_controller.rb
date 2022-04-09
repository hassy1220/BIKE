class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    # debugger
    unless current_user.followeds.exists?(id: user.id)
      relationship = Relationship.new
      relationship.followed_id = current_user.id
      relationship.follow_id = user.id
      relationship.save
    end
    redirect_to request.referer
  end
  def destroy
    user = User.find(params[:user_id])
    if current_user.followeds.exists?(id: user.id)
      relationship = Relationship.find_by(followed_id: current_user.id, follow_id: user.id)
      relationship.destroy
    end
    redirect_to request.referer
  end
end
