class SessionsController < Devise::SessionsController
  def new
    clean_up_passwords(build_resource)
    redirect_to root_path, :notice => 'You must login to post or vote a note!!'
  end
end

