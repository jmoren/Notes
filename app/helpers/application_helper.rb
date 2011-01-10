require 'textilizer'
module ApplicationHelper
  include ActsAsTaggableOn::TagsHelper

  def textilize(text)
    Textilizer.new(text).to_html.html_safe unless text.blank?
  end
  
  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  
end

