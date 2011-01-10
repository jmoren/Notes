class NotasController < ApplicationController
  respond_to :html, :xml, :json

  can_edit_on_the_spot
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  before_filter :find_user_note, :only => [:destroy, :edit, :update]

  autocomplete :tags, :name

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

  end

  def update
    if @nota.update_attributes(params[:nota])
      flash[:notice] = "Successfully updated nota."
      redirect_to @nota
    else
      render :action => 'edit'
    end
  end

  def destroy
    @nota.destroy
    flash[:notice] = "Successfully destroyed nota."
    redirect_to notas_url
  end

  def add_vote
    vote = current_user.votes.create(:nota_id => params[:id])
    @nota = vote.nota
  end
  def all_tags
    @tags_list = Nota.all_tag_counts.where("name like ?", "%#{params[:term]}%").map{|x| x.name }.flatten
    respond_with(@tags_list)
  end


  private

  def find_user_note
    @nota = current_user.notas.find(params[:id])
  end



end

