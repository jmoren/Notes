class NotasController < ApplicationController
  can_edit_on_the_spot
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
    @nota = current_user.notas.find(params[:id])
  end

  def update
    @nota = current_user.notas.find(params[:id])
    if @nota.update_attributes(params[:nota])
      flash[:notice] = "Successfully updated nota."
      redirect_to @nota
    else
      render :action => 'edit'
    end
  end

  def destroy
    @nota = current_user.notas.find(params[:id])
    @nota.destroy
    flash[:notice] = "Successfully destroyed nota."
    redirect_to notas_url
  end

  def add_vote
    vote = current_user.votes.create(:nota_id => params[:id])
    @nota = vote.nota
  end
end

