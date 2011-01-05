class Admin::CommentsController < AdminController
  before_filter :find_comment, :only => [:edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def edit
  end

  def update
    if @comment.update_attributes(params[:comment])
      redirect_to admin_comments_path, :notice => 'Comment was updated!'
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    redirect_to admin_comments_path, :notice => "The comment was deleted!"
  end

  private

  def find_comment
    @comment = Comment.find(params[:id])
  end
end

