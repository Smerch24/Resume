class PagesController < ApplicationController
  def index
    @page = Page.find(1)
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
    @comments = @page.comments
    @comment = Comment.new
  end
end
