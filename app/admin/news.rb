ActiveAdmin.register News do
  index do
    column :title do |news|
      link_to news.title, admin_news_path(news)
    end
    column :content do |news|
      news.content[0..250].html_safe
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

  show do |news|
    attributes_table do
      row :title
      row :content do
        news.content.html_safe
      end
    end
    active_admin_comments
  end
end
