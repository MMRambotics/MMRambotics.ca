xml.instruct!
xml.urlset :xmlns => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  xml.url do
    xml.loc "http://mmrambotics.ca"
    xml.changefreq "daily"
    xml.priority 1.0
  end

  Page.all.each do |page|
    xml.url do
      xml.loc page_url(page)
      xml.priority 0.8
      xml.lastmod page.updated_at.to_date.to_s
    end
  end

  Album.all.each do |album|
    xml.url do
      xml.loc album_url(album)
      xml.priority 0.5
    end
  end

  Photo.all.each do |photo|
    xml.url do
      xml.loc photo_url(photo)
      xml.priority 0.5
      xml.lastmod photo.updated_at.to_date.to_s
    end
  end

  Menu.all.each do |menu|
    xml.url do
      xml.loc menu_url(menu)
      xml.priority 0.3
    end
  end
end
