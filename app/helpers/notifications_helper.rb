module NotificationsHelper
  def notification_form(notification)
    @visitor = notification.visitor
    @comment = nil
    @visitor_comment = notification.comment_id
    # actionごとに振り分け
    case notification.action
      when "follow"
        tag.a(notification.visitor.name) + "があなたをフォローしました"
      when "trip_like"
        tag.a(notification.visitor.name)+ "が" + tag.a('あなたの投稿', href: trip_path(notification.trip_id)) + "にいいねしました"
      when "comment"
        @comment = Comment.find_by(id: @visitor_comment)&.content
        tag.a(@visitor.name) + "が"+ tag.a('あなたの投稿', href:trip_path(notification.trip_id)) + "にコメントしました"
      when "dm" then
        tag.a(notification.visitor.name, href: user_path(@visitor)) + "があなたにDMしました。"
    end
  end

  # 未確認の通知メソッドの設定
  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end
end
