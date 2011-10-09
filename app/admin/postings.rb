ActiveAdmin.register Posting do
  form do |f|
    f.inputs "New Posting" do
      f.input :category,
        :as => :select,
        :collection => Posting.categories
      f.input :read_more_url,
        :label => "Link to Read More",
        :hint  => "If necessary you may add an external link for more information."
      f.input :custom_date,
        :as    => :date,
        :label => "Custom Date",
        :hint  => "Enter a future or past date if the posting doesn't apply to today."
      f.input :content,
        :hint => "Content must be short, under 140 characters.",
        :input_html => { :rows => 2 }
      f.input :sticky
    end

    f.buttons
  end
end
