class Admin::CommentsController < AdminController
  before_filter :find_comment, :only => [:destroy]

  def index
    @comments = Comment.all
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

