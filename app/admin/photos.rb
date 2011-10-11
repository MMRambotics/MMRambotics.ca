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
    end

    f.buttons
  end
end
