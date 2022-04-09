class PostBikesController < ApplicationController
  def new
    # @post_bike = PostBike.new
  end
  def create
    @post_bike = PostBike.new(name: params[:name],opinion: params[:opinion],engine: params[:engine],maker: params[:maker])
    @post_bike.user_id = current_user.id
    @post_bike.save
    # フォームから送られてきたtag_nameを取得し、配列に変換
    tag = params[:tag_name].split(",")
    #　Tagのデータベースから、:tag_nameの値を全て取得し配列とする
    old_tag = Tag.pluck(:tag_name)
    # 上記二つを取得し、差し引いてやる（保存済みの名前はここで除去する）
    new_tag = tag - old_tag
    # 新規タグの保存
    new_tag.each do |n|
      Tag.create(tag_name: n)
    end

    tag.each do |n|
      tag = Tag.find_by(tag_name: n)
      PostTag.create(post_bike_id: @post_bike.id,tag_id: tag.id)
    end
    redirect_to users_path
  end

  def show
    @post_bike = PostBike.find(params[:id])
    @post_bike_comment = PostBikeComment.new
  end

  def index
    to = Time.current
    from = (to -6.day)
    tab = params[:key]
    # indexのタグ一覧から飛んできた場合
    if tab.blank?
      @post_bikes = PostBike.all
      @post_bikes = PostBike.includes(:likes).sort{|b,a|a.likes.size <=>b.likes.size}
      @tags = Tag.all
    else
      @post_bikes = Tag.find_by(id: tab.to_i).post_bikes
      @tags = Tag.all
    end
    def edit
      @post_bike = PostBike.find(params[:id])
    end
  end
  private
  def post_bike_params
    params.require(:post_bike).permit(:name,:opinion,:engine,:maker)
  end
end
