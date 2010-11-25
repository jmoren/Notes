class PagesController < ApplicationController
  def topic
    if params[:topic]
      topic = params[:topic]
      @topic = Topic.find_by_name(topic)
      @notas = @topic.notas.paginate(:page => params[:page], :per_page => 12)
      @total = @topic.notas.size
    end
  end

  def category
    if params[:category]
      category = params[:category]
      @category = Category.find_by_name(category)
      @notas = @category.notas.paginate(:page => params[:page], :per_page => 12)
      @total = @category.notas.size
    end
  end

end
