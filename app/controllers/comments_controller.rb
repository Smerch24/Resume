class CommentsController < ApplicationController
  class CommentsController < ApplicationController
    def create
      @page = Page.find(params[:id])
      @comment = @page.comments.new(comment_params)

      if @comment.save
        redirect_to @page
      else
        render 'pages/show'
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:name, :content)
    end
  end
end
