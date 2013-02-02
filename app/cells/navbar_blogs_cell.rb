class NavbarBlogsCell < Cell::Rails

  def display
    @blogs = Blog.order("name").all

    render
  end

end
