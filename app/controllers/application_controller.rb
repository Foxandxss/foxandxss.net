class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :page_name, :page_footer
  before_filter :set_locale, :set_locale_from_url

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

  def set_locale
    I18n.locale = params[:locale] || ((lang = request.env['HTTP_ACCEPT_LANGUAGE']) && lang[/^[a-z]{2}/])
  end
end
