ActiveAdmin.register Page do
  index do
    column :title
    column :updated_at

    default_actions
  end

  form do |f|
    f.inputs "Page" do
      f.input :title
      f.input :content
      f.input :external_link,
        :label => "External Website URL",
        :hint => "Specifying this instead of content will set this as an external page."
      f.input :menu,
        :hint => "The page will be placed under this menu heading."
      f.input :is_index,
        :hint => "Checking this on will designate this to be the homepage."
    end

    f.buttons
  end
end
