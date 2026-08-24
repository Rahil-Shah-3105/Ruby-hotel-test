module ApplicationHelper
logger           = ActiveSupport::Logger.new(STDOUT)
  def create_link(text, path)
	warn("[DEBUG] >>> Entering create_link(text=#{text},path=#{path})")
    class_name = current_page?(path) ? 'active' : ''

	warn("[DEBUG] create_link(text=#{text},path=#{path}): class_name → <redacted>")
    content_tag(:li, class: class_name) do
      link_to text, path
	warn("[DEBUG] <<< Exiting create_link(text=#{text},path=#{path})")
    end
  end

  def flash_class(level)
	warn("[DEBUG] >>> Entering flash_class(level=#{level})")
    case level
      when 'notice' then 'alert alert-info'
      when 'success' then 'alert alert-success'
      when 'error' then 'alert alert-danger'
      when 'alert' then 'alert alert-warning'
      else ''
	warn("[DEBUG] <<< Exiting flash_class(level=#{level})")
    end
  end
end
