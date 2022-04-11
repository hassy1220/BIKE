class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # 今日の投稿したものを範囲で取得
    @today_user_post = @user.post_bikes.where(created_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day)
     # 昨日の投稿したものを範囲で取得
    @yesterday_user_post = @user.post_bikes.where(created_at: Time.zone.yesterday.beginning_of_day..Time.zone.yesterday.end_of_day)

    if @today_user_post.count == 0 || @yesterday_user_post.count == 0
      @ratio = "比較不可"
    else
      @ratio = (@today_user_post.count / @yesterday_user_post.count) * 100
    end
    # 今週の合計を配列で取得
    @week_post_bike = @user.post_bikes.where(created_at: 1.week.ago..Time.zone.now)
     # 先週の合計を配列で取得
    @weeks_post_bike = @user.post_bikes.where(created_at: 2.week.ago..1.week.ago)

    if @week_post_bike.count == 0 || @weeks_post_bike.count == 0
      @ratios = "比較不可"
    else
      @ratios = (@week_post_bike.count / @weeks_post_bike.count) * 100
    end
    # 一週間前までの投稿を日にち毎に配列で取得
    @week_today = @user.post_bikes.where(created_at: Time.zone.now.all_day).count
    @week_yesterday = @user.post_bikes.where(created_at: Time.zone.yesterday.all_day).count
    @week_2day = @user.post_bikes.where(created_at: Time.zone.now.ago(2.days).all_day).count
    @week_3day = @user.post_bikes.where(created_at: Time.zone.now.ago(3.days).all_day).count
    @week_4day = @user.post_bikes.where(created_at: Time.zone.now.ago(4.days).all_day).count
    @week_5day = @user.post_bikes.where(created_at: Time.zone.now.ago(5.days).all_day).count
    @week_6day = @user.post_bikes.where(created_at: Time.zone.now.ago(6.days).all_day).count

  end
  def index
    @users = User.all
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  private
  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end
end
