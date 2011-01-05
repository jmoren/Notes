class AdminController < ApplicationController
  access_control do
    allow :admin
  end

  layout 'admin'

  def index
  end
end

