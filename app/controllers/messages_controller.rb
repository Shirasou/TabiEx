class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.new(message_params)
      @room = @message.room
      if @message.save
        @roommembernotme = Entry.where(room_id: @room.id).where.not(user_id: current_user.id)
        @theid = @roommembernotme.find_by(room_id: @room.id)
        notification = current_user.active_notifications.new(
          room_id: @room.id,
          message_id: @message.id,
          visited_id: @theid.user_id,
          visitor_id: current_user.id,
          action: 'dm'
        )
        # 自分の投稿に対するコメントの場合は、通知済みとする
        if notification.visitor_id == notification.visited_id
          notification.checked = true
        end
        notification.save if notification.valid?
        redirect_to "/rooms/#{@message.room_id}"
      end
    else
      flash[:alert] = "メッセージ送信に失敗しました。"
    end
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :message, :room_id).merge(user_id: current_user.id)
  end
end
