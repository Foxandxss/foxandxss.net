ActiveAdmin.register PageCategory do
  menu parent: "Page"

  index do
    column :name do |category|
      link_to category.name, admin_page_category_path(category)
    end
    default_actions
  end
end
