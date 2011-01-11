class NotasController < ApplicationController
  respond_to :html, :xml, :json

  can_edit_on_the_spot
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  before_filter :find_user_note, :only => [:destroy, :edit, :update]



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
    tags = []
    params[:tag_list].split(',').each{|tag| tags << ActsAsTaggableOn::Tag.find_or_create_by_name(tag.strip)}
    params[:nota][:tag_list] = tags
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

  def refresh_index
    call_rake ("ts:reindex")
  end


end

