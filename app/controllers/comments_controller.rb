class CommentsController < ApplicationController
  def new
    @page = Page.find(params[:page_id])
    @comment = @page.comments.new
  end

  def create
    @page = Page.find(params[:page_id])
    @comment = @page.comments.new(comment_params)

    if @comment.save
      redirect_to @page
    else
      render 'pages/show'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :content)
  end
end
