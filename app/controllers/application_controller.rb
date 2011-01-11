class ApplicationController < ActionController::Base
  before_filter :tags

  rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
    render :text => exception, :status => 500
  end

  rescue_from Acl9::AccessDenied, :with => :not_allowed

  protect_from_forgery

private


  def tags
    @tags = Nota.tag_counts_on(:tags)
  end

  def not_allowed
    redirect_to root_url, :notice => "You don't have permission to access this page"
  end

  def call_rake(task, options = {})
    options[:rails_env] ||= Rails.env

    args = options.map { |n, v| "#{n.to_s.upcase}='#{v}'" }
    system "bundle exec rake #{task} --trace 2>&1 >> #{Rails.root}/log/rake.log &"
  end

end

