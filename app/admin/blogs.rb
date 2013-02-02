ActiveAdmin.register Blog do
  menu parent: "Blog", priority: 1

  index do
    selectable_column
    column :name do |blog|
      link_to blog.name, admin_blog_path(blog)
    end
    column :url do |blog|
      link_to blog.url, blog.url
    end
    column :status do |blog|
      blog.status.name
    end
    default_actions
  end

  form do |f|
    f.inputs "" do
      f.input :name
      f.input :url
      f.input :status, include_blank: false
    end
    f.buttons
  end

  show do |blog|
    attributes_table do
      row :name
      row :url
      row :status do
        blog.status.name
      end
    end
    active_admin_comments
  end
end
