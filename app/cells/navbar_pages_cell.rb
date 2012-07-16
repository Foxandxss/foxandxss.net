class NavbarPagesCell < Cell::Rails

  def display
    @pagetypes = PageType.all
    render
  end

end
