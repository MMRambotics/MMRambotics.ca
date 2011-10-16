ActiveAdmin.register Location do
  index do
    column :place
    column :latitude
    column :longitude
    column :read_more

    default_actions
  end

  form do |f|
    f.inputs "Location" do
      f.input :place
      f.input :read_more,
        :label => "Read More URL",
        :hint  => "External URL to read more about the location."
      f.input :description
    end

    f.buttons
  end
end
