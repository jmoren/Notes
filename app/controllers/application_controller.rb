class ApplicationController < ActionController::Base
  rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
    render :text => exception, :status => 500
  end

  protect_from_forgery
  private

  def call_rake(task, options = {})
    options[:rails_env] ||= Rails.env

    args = options.map { |n, v| "#{n.to_s.upcase}='#{v}'" }
debugger
    system "bundle exec rake #{task} --trace 2>&1 >> #{Rails.root}/log/rake.log &"
    #system "#{Rails.root}/bundle exec rake #{task} #{args.join(' ')} --trace 2>&1 >> #{Rails.root}/log/rake.log &"
    #"/usr/bin/rake #{task} #{args.join(' ')} --trace 2>&1 >> #{Rails.root}/log/rake.log &"
  end

end

