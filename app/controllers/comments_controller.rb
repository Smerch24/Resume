class CommentsController < ApplicationController
  before_action :find_page_by_id, only: %i[new create destroy]

  def new
    @comment = @page.comments.new
  end

  def create
    @comment = @page.comments.new(comment_params)

    if @comment.save
      redirect_to @page
    else
      @comments = @page.comments
      render 'pages/show'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_page_path(@page)
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :content)
  end

  def find_page_by_id
    @page = Page.find(params[:page_id])
  end
end
