ActiveAdmin.register BlogStatus do
  menu parent: "Blog"

  index do
    selectable_column
    column :name do |status|
      link_to status.name, admin_blog_status_path(status)
    end
    column :url do |status|
      status.color
    end
    column "Blogs number" do |status|
      span status.blogs.count, class: "blogs_count"
    end
    default_actions
  end
end
