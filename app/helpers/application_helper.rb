module ApplicationHelper
	def mobile_device
  agent = request.user_agent
  return "tablet" if agent =~ /(tablet|ipad)|(android(?!.*mobile))/i
  return "mobile" if agent =~ /Mobile/
  return "desktop"
end
def checked(area)
		@order.repeat.nil? ? false : @order.repeat.match(area)
end
end
