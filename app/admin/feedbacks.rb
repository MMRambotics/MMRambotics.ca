ActiveAdmin.register Feedback do
  index do
    column :name
    column :email
    column "Contact Permission?", :can_contact
    column :person
    column :browser
    column "IP", :ip
    column "Date", :sortable => :created_at do |feedback|
      div do
        time_ago_in_words(feedback.created_at)
      end
    end
    column do |feedback|
      div do
        links = "".html_safe
        links += link_to "View", admin_feedback_path(feedback), :class => "member_link view_link"
        links += link_to "Delete", admin_feedback_path(feedback), :method => :delete, :confirm => "Are you sure you want to delete this?", :class => "member_link delete_link"
        links
      end
    end
  end
end
