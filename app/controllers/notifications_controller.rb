class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    # 自分の投稿に紐づいた通知
    @notifications = current_user.passive_notifications.page(params[:page]).per(10)
    # 確認済みでない通知
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end

  def all_destroy
    @nitofications = current_user.passive_notifications.destroy_all
    redirect_to request.referer
  end
end
