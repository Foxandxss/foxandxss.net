ActiveAdmin.register PageCategory do
  menu parent: "Page"

  index do
    selectable_column
    column :name do |category|
      link_to category.name, admin_page_category_path(category)
    end
    column "Pages number" do |category|
      span category.pages.count, class: "pages_count"
    end
    default_actions
  end
end
