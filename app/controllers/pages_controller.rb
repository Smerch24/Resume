class PagesController < ApplicationController
  @pages = Page.all
  def index
    @page = Page.find(1)
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
    @comment = Comment.new
  end
end
