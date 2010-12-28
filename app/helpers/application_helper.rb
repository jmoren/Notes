require 'textilizer'
module ApplicationHelper
  include ActsAsTaggableOn::TagsHelper

  def textilize(text)
    Textilizer.new(text).to_html.html_safe unless text.blank?
  end

end

