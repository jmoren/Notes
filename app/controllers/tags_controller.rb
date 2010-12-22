class TagsController < ApplicationController
  
  def by_tag
    if params[:tag]
      tag = params[:tag]
      @notas = Nota.tagged_with(tag).paginate(:page => params[:page], :per_page => 12)
    end
  end

end
