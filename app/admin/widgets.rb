ActiveAdmin.register Widget do
  index do
    selectable_column
    column :title do |widget|
      link_to widget.title, admin_widget_path(widget)
    end
    column :content do |widget|
      widget.content.html_safe
    end
    default_actions
  end

  form do |f|
    f.inputs "" do
      f.input :title, label: false, input_html: { width: 50 }
      f.input :content, as: :ckeditor, label: false
    end
    f.buttons
  end

  show do |widget|
    attributes_table do
      row :title
      row :content do
        widget.content.html_safe
      end
    end
    active_admin_comments
  end
end
