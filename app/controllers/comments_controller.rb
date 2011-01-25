class CommentsController < ApplicationController
  can_edit_on_the_spot
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def comments_by_note
    @comments = Comment.where(:nota_id => params["nota_id"])
  end


  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(params[:comment])
    @nota = @comment.nota
    respond_to do |format|
      if @comment.save
        @nota.comments.reload
        format.js
      else
        format.html {render :action => 'new'}

        #TODO we should show error messages
        format.js {render ''}
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Successfully updated comment."
      redirect_to @comment
    else
      render :action => 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Successfully destroyed comment."
    redirect_to comments_url
  end
end

