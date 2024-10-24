# frozen_string_literal: true

# Controller for managing pages for users
class PagesController < ApplicationController
  before_action :initialize_comment, only: %i[index show]
  def index
    @page = Page.find(1)
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
    @comments = @page.comments
  end

  private

  def initialize_comment
    @comment = Comment.new
  end
end
