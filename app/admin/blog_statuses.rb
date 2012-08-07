ActiveAdmin.register BlogStatus do
  menu parent: "Blog"

  index do
    column :name do |status|
      link_to status.name, admin_blog_status_path(status)
    end
    column :url do |status|
      status.color
    end
    default_actions
  end
end
