class RoomUsersController < ApplicationController
  def show
    @room = Room.find(params[:id])
  end
  def create
    # 相手のUSERのIDを取得する
    user = User.find(params[:user_id])
    # 相手のUserのROOM一覧を取得
    user_room = user.rooms
    # ログイン中のユーザーのROOMの中に、user_roomのIDが存在するか
    if current_user.rooms.exists?(id: user_room)
      redirect_to user_room_users_chats_path(user.id)
    else
      @new_room = Room.new
      @new_room.save
      # 中間テーブルに相手の情報を保存
      you_room = RoomUser.create(user_id: user.id,room_id: @new_room.id)
      # 中間テーブルに自分の情報を保存
      my_room = RoomUser.create(user_id: current_user.id,room_id: @new_room.id)
      # 中間テーブル（CHAT）に情報を保存
      you_chat_room = Chat.create(user_id: user.id,room_id: @new_room.id)
       # 中間テーブル（CHAT）に情報を保存
      my_chat_room = Chat.create(user_id: current_user.id,room_id: @new_room.id)
      redirect_to user_room_users_chats_path(user.id)
    end
  end
end
