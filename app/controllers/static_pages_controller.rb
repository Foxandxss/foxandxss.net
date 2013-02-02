class StaticPagesController < ApplicationController
  def home
    @news = News.order("created_at DESC").page(params[:page])
  end
end
