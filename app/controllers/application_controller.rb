class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :page_name

  private
    def page_name
      @page_name = Option.find_by_name("page_name")
    end
end
