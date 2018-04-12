require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'yaml'

url = "https://coinmarketcap.com/all/views/all/"

page_1 = Nokogiri::HTML(open(url))

url_2 = "https://coinmarketcap.com/calculator/"

page_2 = Nokogiri::HTML(open(url_2))

arr = []

arr << page_1.css('a.price[1][1]').text

temps = arr[0].split("$")

puts temps[1]


arr_2 = []

arr_2 << page_1.css('a.currency-name-container')

temps_2 = (arr_2[0]).to_s

puts (temps_2.to_s).class

kiki = []

temps_2.split('<a class="currency-name-container" href="/currencies/').each do |l|
  kiki << l
end

koko = []

kiki.each do |lulu|
  koko << lulu.gsub(/a.*/, '/')

end

puts koko

