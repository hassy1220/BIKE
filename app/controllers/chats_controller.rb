class ChatsController < ApplicationController
  def show
    # 相手のUserのID取得
    @user = User.find(params[:user_id])
    # 相手のUSERが所属しているROOMを取得
    you_room = @user.rooms
    # 相手のUSERが所属しているROOMを取得
    my_room = current_user.rooms
    # 重複している値を取得
    room = you_room & my_room
    room.each do |f|
     @room=f
    end
    @chat = Chat.new
  end

  def create
    user = User.find(params[:user_id])
    # 相手のUSERが所属しているROOMを取得
    you_room = user.rooms
    # 相手のUSERが所属しているROOMを取得
    my_room = current_user.rooms
    # 重複している値(配列)を取得(一件だけ取得する)
    room = you_room & my_room

    room.each do |n|
      @room = n
    end

    chat = Chat.new(chat_params)
    chat.user_id = current_user.id
    chat.room_id = @room.id
    chat.save
    redirect_to user_room_users_chats_path(user.id)
  end
  def chat_params
    params.require(:chat).permit(:comment)
  end
end
