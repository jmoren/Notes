class NotasController < ApplicationController
  uses_tiny_mce :only => [:index,:new, :create,:search,:show],:options => {
                              :theme => 'advanced',
                              :plugins => %w{ table }
                            }
  
  before_filter :set_controller
  def index
    @notas = Nota.pagination(params[:page])
  end
  
  def show
    @nota = Nota.find(params[:id])
    @nota.add_view unless @nota.new_record?
  end
  
  def new
    @nota = Nota.new
  end
  
  def create
    @nota = Nota.new(params[:nota])
    if @nota.save
      flash[:notice] = "Successfully created nota."
      redirect_to notas_path
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
