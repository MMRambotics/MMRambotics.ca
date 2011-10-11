ActiveAdmin.register Album do
  form do |f|
    f.inputs "Album" do
      f.input :read_more,
        :label => "External Read More URL",
        :hint  => "Give a viewer an external URL to read more about the contents of the album."
      f.input :title
    end

    f.buttons
  end
end
