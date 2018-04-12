require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'yaml'

def get_link(url)
  page_2 = Nokogiri::HTML(open(url))
  site_startup = page_2.css("div#listing-detail-section-description div div[1] div p[5]")
  return site_startup
end


def get_startups
  page = Nokogiri::HTML(open("http://www.alloweb.org/annuaire-startups/annuaire-incubateurs-startups/"))
  name_startup = []
  page.css('div#filter-2 div form div[10] option').each do |namo|
    name_startup << namo.content
  end
  redirect = page.css('div#primary div[3] a.listing-row-image-link')
  link_to_link_to_website = []
  page.css('div#filter-2 div form div[10] option').each do |link|
    link_to_link_to_website << "http://www.alloweb.org/annuaire-startups/annuaire-incubateurs-startups/#{link['value'].gsub('liste-startups-incubees-par-', '')}"
  end
  # link_to_website = []

  # link_to_link_to_website.each do |url|
  #   if url == "http://www.alloweb.org/annuaire-startups/annuaire-incubateurs-startups/incubateur-ceei-chartres" || url == "http://www.alloweb.org/annuaire-startups/annuaire-incubateurs-startups/incubateur-ceei-provence"
  #   else
  #     puts url
  #     # File.write('direct_website.yml', YAML.dump(get_link(url)))
  #     link_to_website << get_link(url)
  #   end
  # end

  # puts link_to_website



  startups = Hash[name_startup.zip(link_to_link_to_website.map {|i| i.include?('-') ? i : i} ) ]

  # puts startups

end

# get_startups

puts get_startups

# get_link ne fonctionne pas et plus de temps pour ce soir .... Nokogiri m'a eu ... ^^
