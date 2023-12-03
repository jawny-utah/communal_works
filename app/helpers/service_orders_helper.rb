module ServiceOrdersHelper
  def service_order_status(status)
    case status.to_sym
    when :on_review
      "В обробці"
    when :in_progress
      "В процесі виконання"
    when :finished
      "Завершений"
    when :cancelled
      "Відмінений"
    end
  end
end
