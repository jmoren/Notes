class NotasController < ApplicationController
  can_edit_on_the_spot
  before_filter :set_controller
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

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
    @nota = current_user.notas.build(params[:nota])
    if @nota.save
      flash[:notice] = "Successfully created nota."
      redirect_to @nota
    else
      render 'new'
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

