require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))
puts page.class  # => Nokogiri::HTML::Document

# puts page.css('title')[0].name
# puts page.css('title')[0].text

# page.css('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td').each do |td|
#   puts td.text
# end


puts page.css('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text

puts "try it"

# puts page.css("/html/body/div/main/section[2]/div//table/tbody/tr[2]/td/table/tbody/tr/td[1]/p").text

news_links = page.css("html body a.lientxt")


puts page.css("/html/body/div/main/section[2]/div/table/tbody/tr[1]")

# [2]/td/table/tbody/tr/td[1]/p/a[1]

puts news_links

# news_links.each{|link| puts "#{link.text}\t#{link['href']}"}

# news_links = page.css("/html/body/div/main/section[2]/div//table/tbody/tr[2]/td/table/tbody/tr/td[1]/p")

# news_links.each{|link| puts "#{link.text}\t#{link['href']}"}









