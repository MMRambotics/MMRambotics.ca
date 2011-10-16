ActiveAdmin.register Album do
  form do |f|
    f.inputs "Album" do
      f.input :read_more,
        :label => "External Read More URL",
        :hint  => "Give a viewer an external URL to read more about the contents of the album."
      f.input :title

      f.has_many :location_datas do |l|
        l.input :location_id,
          :label => "Location",
          :as => :select,
          :collection => Location.all
        l.input :_destroy,
          :as => :boolean,
          :label => "Delete",
          :wrapper_html => { :class => "hidden delete-input" }
          # Javascript will remove the initial input's hidden classes.  Thus
          # having any new inputs have no delete checkbox.
      end
    end

    f.buttons
  end
end
