require_relative "model.rb"
module Figo
  # Retrieve list of registered notifications.
  #
  # @return [Notification] an array of `Notification` objects, one for each registered notification
  def notifications
    query_api_object Notification, "/rest/notifications", nil, "GET", "notifications"
  end

  # Retrieve specific notification.
  #
  # @param notification_id [String] ID of the notification to be retrieved
  # @return [Notification] `Notification` object for the respective notification
  def get_notification(notification_id)
    query_api_object Notification, "/rest/notifications/#{notification_id}"
  end

  # Register a new notification.
  #
  # @param notification [Notification] notification to be crated. It should not have a notification_id set.
  # @return [Notification] newly created `Notification` object
  def add_notification(notification)
    query_api_object Notification, "/rest/notifications", notification.dump(), "POST"
  end

  # Modify notification.
  #
  # @param notification [Notification] modified notification object
  # @return [Notification] modified notification returned by server
  def modify_notification(notification)
    query_api_object Notification, "/rest/notifications/#{notification.notification_id}", notification.dump(), "PUT"
  end

  # Unregister notification.
  #
  # @param notification [Notification, String] notification object which should be deleted or its ID
  def remove_notification(notification)
    query_api notification.is_a?(String) ? "/rest/notifications/#{notification}" : "/rest/notifications/#{notification.notification_id}", nil, "DELETE"
  end
end
