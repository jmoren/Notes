class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter do
    if params[:query]
      q = params[:query]
      search
    end
  end
  def search

    options = {}
    options[:body] = params[:query][:body] unless params[:query][:body].blank?
    options[:topic_id] = Topic.find_by_name(params[:query][:topic]) unless params[:query][:topic].blank?
    options[:category_id] = Category.find_by_name(params[:query][:category]) unless params[:query][:category].blank?
    @notas = Nota.where(options).paginate(:page => params[:page], :per_page => 12)
  end

end

