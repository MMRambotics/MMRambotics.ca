ActiveAdmin.register Ad do
  index do
    column :title
    column :image
    column "External URL", :external_url
    column :format
    column :priority
    column :active

    default_actions
  end

  form do |f|
    f.inputs "Ad" do
      f.input :title
      f.input :image
      f.input :external_url, :label => "External URL"
      f.input :format,
        :as => :select,
        :collection => %w( rotating )
      f.input :priority,
        :label => "Ordering Priority",
        :hint  => "Menu is displayed with the highest priority item first.",
        :input_html => { :class => "small-input" }
      f.input :active
    end

    f.buttons
  end

  sidebar :help do
    "Sponsor logos can be referenced from /sponsor_logos/."
  end
end
