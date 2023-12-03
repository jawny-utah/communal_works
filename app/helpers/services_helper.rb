module ServicesHelper
  def service_created_by_current_user?(worker_id)
    current_user.worker&.id == worker_id
  end

  def service_status(status)
    case status.to_sym
    when :on_review
      "На розгляді"
    when :active
      "Активний"
    when :not_active
      "Неактивний"
    end
  end
end
