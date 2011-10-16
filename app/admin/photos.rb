ActiveAdmin.register Photo do
  index do
    column :title
    column :slideshow
    column :image_file_name
    column :thumbnail_file_name
    column :updated_at
    column :album

    default_actions
  end

  form do |f|
    f.inputs "Photo" do
      f.input :title
      f.input :description
      f.input :album_id,
        :as => :select,
        :collection => Album.all
      f.input :image,
        :as => :file
      f.input :thumbnail,
        :as   => :file,
        :hint => "Make sure the aspect ratio is 1:1."
      f.input :slideshow,
        :label => "In slideshows?",
        :hint  => "Checking this on will place the image as part of randomized slideshows such as those on the homepage."
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
