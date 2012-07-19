class StaticPagesController < ApplicationController
  def home
    @news = News.order("created_at DESC").all
  end
end
