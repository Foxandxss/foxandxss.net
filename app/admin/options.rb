ActiveAdmin.register Option do
  actions :index, :show, :edit, :update

  index do
    column :name do |option|
      link_to option.name, admin_option_path(option)
    end
    column :value
    column "Edit" do |option|
      link_to "Edit", edit_admin_option_path(option)
    end
  end

  form do |f|
    f.inputs "" do
      f.input :name, :input_html => { :disabled => true }
      f.input :value
    end
    f.buttons
  end
end
