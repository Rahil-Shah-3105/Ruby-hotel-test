module FilterFormHelper
logger           = ActiveSupport::Logger.new(STDOUT)
  def define_value(params, field)
	warn("[ERROR] >>> Entering define_value(params=#{params},field=#{field})")
    params.nil? ? '' : params[field]
  end
end
