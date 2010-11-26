class NotasController < ApplicationController
  can_edit_on_the_spot
  uses_tiny_mce :only => [:index,:new, :create],:options => {
                              :theme => 'advanced',
                              :theme_advanced_resizing => true,
                              :plugins => %w{ table fullscreen }
                            }
  
  before_filter :set_controller
  def index
    if params[:query]
      options = {}
      options[:body] = params[:query][:body] unless params[:query][:body].blank?
      options[:topic_id] = Topic.find_by_name(params[:query][:topic]) unless params[:query][:topic].blank?
      options[:category_id] = Category.find_by_name(params[:query][:category]) unless params[:query][:category].blank?
      @notas = Nota.where(options).paginate(:page => params[:page], :per_page => 12)
    else
      @notas = Nota.pagination(params[:page])
    end
  end
  
  def show
    @nota = Nota.find(params[:id])
    render :partial => 'shared/note'
  end
  
  def new
    @nota = Nota.new
  end
  
  def create
    @nota = Nota.new(params[:nota])
    if @nota.save
      flash[:notice] = "Successfully created nota."
      @notas = Nota.pagination(params[:page])
    end
  end
  
  def edit
    @nota = Nota.find(params[:id])
  end
  
  def update
    @nota = Nota.find(params[:id])
    if @nota.update_attributes(params[:nota])
      flash[:notice] = "Successfully updated nota."
      redirect_to @nota
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @nota = Nota.find(params[:id])
    @nota.destroy
    flash[:notice] = "Successfully destroyed nota."
    redirect_to notas_url
  end
  def set_controller
    @notas_controller = true
  end

  def add_vote
    @nota = Nota.find(params[:id])
    vote = @nota.vote + 1
    @nota.update_attributes(:vote => vote)
  end
  
end
