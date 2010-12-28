class ApplicationController < ActionController::Base
  before_filter :tags

  rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
    render :text => exception, :status => 500
  end
  protect_from_forgery

  private

  def tags
    @tags = Nota.tag_counts_on(:tags)
  end
end

