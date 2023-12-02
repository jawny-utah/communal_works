module ServicesHelper
  def service_created_by_current_user?(worker_id)
    current_user.worker&.id == worker_id
  end
end
