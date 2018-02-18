module ApplicationHelper
  def image obj
    obj.image? ? obj.image.url : "/image/logo.png"
  end
end
