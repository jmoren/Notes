class NotasController < ApplicationController
  can_edit_on_the_spot
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]


  def index
    @notas = Nota.pagination(params[:page])
  end

  def search

    @notas = Nota.search(params[:search], :include => "comments")
    @notas_found = []
    @comments_found = []
    @notas.each_with_weighting{|data,weight| weight > 10 ? @notas_found << data : @comments_found << data }

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
      refresh_index
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

  def add_vote
    @nota = Nota.find(params[:id])
    current_user.votes << Vote.new(:nota_id => @nota.id)
    @nota.votes.reload
  end

  private

  def refresh_index
    call_rake ("ts:reindex")
  end
end

