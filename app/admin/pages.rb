ActiveAdmin.register Page do
  menu parent: "Page", priority: 1

  index do
    column :title do |page|
      link_to page.title, admin_page_path(page)
    end
    column :content do |page|
      page.content[0..250].html_safe
    end
    default_actions
  end

  form do |f|
    f.inputs "Page", class: "inputs left" do
      f.input :category, include_blank: false
      f.input :title
      f.input :content, as: :ckeditor, label: false
    end

    f.inputs "Images", class: "inputs right" do
      f.has_many :images do |i|
        i.input :title
        i.input :content, as: :string
        i.input :asset, as: :file, label: "Image", hint: i.object.asset.url =~ /missing/ ? i.template.content_tag(:span, "No Image Yet") : i.template.image_tag(i.object.asset.url(:thumb))
        i.input :_destroy, as: :boolean, label: "Delete"
      end
    end

    f.inputs "Informations", class: "inputs left" do
      f.has_many :informations do |i|
        i.input :title
        i.input :content
        i.input :_destroy, as: :boolean, label: "Delete"
      end
    end

    f.inputs "Links", class: "inputs right" do
      f.has_many :links do |l|
        l.input :title
        l.input :url, as: :url
        l.input :_destroy, as: :boolean, label: "Delete"
      end
    end
    f.buttons
  end

  show do |page|
    attributes_table do
      row :title
      row :content do
        page.content.html_safe
      end
    end
    active_admin_comments
  end
end
