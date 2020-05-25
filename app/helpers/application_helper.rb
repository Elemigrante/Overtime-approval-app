module ApplicationHelper
  def active?(path)
    "active" if current_page?(path)
  end
  
  def status_badge status
    status_span_generator status
  end
  
  private
  
  def status_span_generator status
    case status
      when 'submitted'
        content_tag(:span, status.titleize, class: 'badge badge-primary')
      when 'approved'
        content_tag(:span, status.titleize, class: 'badge badge-success')
      when 'rejected'
        content_tag(:span, status.titleize, class: 'badge badge-danger')
      when 'pending'
        content_tag(:span, status.titleize, class: 'badge badge-info')
      when 'confirmed'
        content_tag(:span, status.titleize, class: 'badge badge-success')
    end
  end
    
    # Bootstrap default allert helper
    # def custom_bootstrap_flash
    #   flash_messages = []
    #   flash.each do |type, message|
    #     type = 'info'
    #     type = 'success' if type == 'notice'
    #     type = 'error'   if type == 'alert'
    #     text = "<script>toastr.#{type}('#{message}');</script>"
    #     flash_messages << text.html_safe if message
    #   end
    #   flash_messages.join("\n").html_safe
    # end
end
