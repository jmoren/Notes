class PagesController < ApplicationController
  uses_tiny_mce :options => {
                              :theme => 'advanced',
                              :plugins => %w{ table }
                            }
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

  def tags
    if params[:tag]
      tag = params[:tag]
      @notas = Nota.tagged_with(tag).paginate(:page => params[:page], :per_page => 12)
    end
  end

end
