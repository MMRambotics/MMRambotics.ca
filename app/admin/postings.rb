ActiveAdmin.register Posting do
  index do
    column :category
    column :content
    column "Custom Date", :custom_date
    column "End Date", :end_date
    column :sticky

    default_actions
  end

  action_item :only => [:index] do
    link_to "Pull from Google", calendar_admin_postings_path
  end

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

  collection_action :calendar, :method => :get do
    Posting.pull_from_gcalendar!
    redirect_to :action => :index, :notice => "Imported Google Calendar items."
  end
end
