module NotificationsHelper
  def notification_class(notification)
    ["notification",
     status_color(notification)].join(" ")
  end

  def notification_bell_classes(user)
    ["ml-4 cursor-pointer",
     bell_color(user)].join(" ")
  end

  private

  def status_color(notification)
    "notification--unread" if !notification.read
  end

  def bell_color(user)
    user.unread_notifications.present? ? "text-red-400 hover:text-red-500" : "text-white hover:text-blue-400"
  end
end
