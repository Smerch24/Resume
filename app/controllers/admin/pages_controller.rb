class Admin::PagesController < ApplicationController
  layout 'admin'
  before_action :authenticate

  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
    @page = Page.find(params[:id])
    @comments = @page.comments
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to admin_pages_path
    else
      render :new
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update(page_params)
      redirect_to admin_page_path(@page)
    else
      render :edit
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to admin_pages_path
  end

  private

  def page_params
    params.require(:page).permit(:title, :body)
  end

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == 'password'
    end
  end
end
