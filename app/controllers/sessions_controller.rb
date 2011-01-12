class SessionsController < Devise::SessionsController
  def new
    clean_up_passwords(build_resource)
    redirect_to root_path, :notice => 'Tenes q estar logueado chabon!!'
  end
end

