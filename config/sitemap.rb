# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://jakifryzjer.pl"

SitemapGenerator::Sitemap.create do
  City.public.each do |city|
    add city_places_path(city), priority: 0.7, changefreq: 'weekly'
  end

  City.public.each do |city|
    city.places.each do |place|
      add city_place_path(city, place), :lastmod => city.updated_at
    end
  end
end
