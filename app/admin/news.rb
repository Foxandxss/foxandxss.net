ActiveAdmin.register News do
  index do
    selectable_column
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
      f.input :image, label: false, as: :file, hint: f.object.image.url =~ /missing/ ? f.template.content_tag(:span, "Size: 580x150") : f.template.image_tag(f.object.image.url(:thumb))

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

  member_action :lock, :method => :get do
    @news = News.find(params[:id])
  end

  action_item :only => :edit do
    link_to('View on site', lock_admin_news_path(news)) if news.title?
  end

end
