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
      @comments = @page.comments
      render 'pages/show'
    end
  end

  def destroy
    @page = Page.find(params[:page_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_page_path(@page)
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :content)
  end
end
