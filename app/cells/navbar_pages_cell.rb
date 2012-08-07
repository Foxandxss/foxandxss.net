class NavbarPagesCell < Cell::Rails

  def display
    @pagecategories = PageCategory.all
    render
  end

end
