require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_the_email_of_a_townhal_from_its_webpage(url)

  page = Nokogiri::HTML(open(url))

  return page.css('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text

end



def get_all_the_urls_of_val_doise_townhalls(url)

  page = Nokogiri::HTML(open(url))

  temp_links = page.css("a.lientxt")

  mairie_links = {}

  temp_links.each do |link|

    mairie_links[link.text] = link['href'].sub(/./, "http://annuaire-des-mairies.com")

  end

