class Admin::PagesController < ApplicationController
  layout 'admin'
  require 'dotenv'
  Dotenv.load
  before_action :find_params_by_id, only: %i[show edit destroy]
  before_action :authenticate

  def index
    @pages = Page.all
  end

  def show
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

  def edit; end

  def update
    if @page.update(page_params)
      redirect_to admin_page_path(@page)
    else
      render :edit
    end
  end

  def destroy
    @page.destroy
    redirect_to admin_pages_path
  end

  private

  def page_params
    params.require(:page).permit(:title, :body)
  end

  def find_params_by_id
    @page = Page.find(params[:id])
  end

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['ADMIN_USERNAME'] && password == ENV['ADMIN_PASSWORD']
    end
  end
end
