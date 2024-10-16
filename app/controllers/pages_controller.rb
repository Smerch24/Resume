class PagesController < ApplicationController
  def index
    @page = Page.find(1)
    @pages = Page.all
    @comment = Comment.new
    @comments = @page.comments
  end

  def show
    @page = Page.find(params[:id])
    @comments = @page.comments
    @comment = Comment.new
  end
end
