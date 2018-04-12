require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'yaml'

# url = "https://coinmarketcap.com/all/views/all/"

# page_1 = Nokogiri::HTML(open(url))

# # Trouver les cours, les rapporter ici, et les traiter pour qu'ils soient propres dans un tableau :

# price_not_arranged = []

# price_not_arranged << page_1.css('a.price[1][1]').text

# price_arranged = price_not_arranged[0].split("$")

# print price_arranged[1561]


# # Trouver les noms, les rapporter ici, les traiter, les re-traiter pour qu'ils soient propres dans un tableau :

# name_not_arranged = []

# name_not_arranged << page_1.css('a.currency-name-container')

# name_always_not_arranged = []

# (name_not_arranged[0]).to_s.split('<a class="currency-name-container" href="/currencies/').each do |line|
#   name_always_not_arranged << line
# end

# name_arranged = []

# name_always_not_arranged.length.times do |i|
#   if !(name_always_not_arranged[i].empty?) && name_always_not_arranged[i].index('/')
#     name_arranged << name_always_not_arranged[i].slice(0..(name_always_not_arranged[i].index('/')-1))
#   end
# end

# # Rangement au propre des 2 précédents tableaux dans un Hash propre :

# name_and_price = {}

# name_arranged.length.times do |i|
#   if !(price_arranged[i+1] == nil)
#     name_and_price[name_arranged[i]] = [price_arranged[i+1]]
#   else
#     name_and_price[name_arranged[i]] = [0]
#   end
# end

# puts name_and_price

# Et si on ne veut pas se faire chier la vie .....

def get_data
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  currency = page.css("td.currency-name")
  values = page.css("a.price")
  currencies = []
  prices = []

  currency.each do |curr|
    currencies << curr['data-sort']
  end

  values.each do |val|
    prices << val['data-usd']
  end

  data = Hash[currencies.zip(prices.map {|i| i.include?(',') ? (i.split /, /) : i})]
end

puts get_data
