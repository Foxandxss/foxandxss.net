class SidebarWidgetsCell < Cell::Rails

  def display
    @widgets = Widget.all
    render
  end

end
