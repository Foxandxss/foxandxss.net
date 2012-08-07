class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :page_name, :page_footer

  private
    def page_name
      @page_name = Option.find_by_name("page_name")
      if @page_name.nil?
        @page_name = Option.new(name: "page_name", value: "Page title")
      end
    end

    def page_footer
      @page_footer = Option.find_by_name("page_footer")
      if @page_footer.nil?
        @page_footer = Option.new(name: "page_footer", value: "Page footer")
      end
    end
end
