require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'yaml'

url = "https://coinmarketcap.com/all/views/all/"

page_1 = Nokogiri::HTML(open(url))

# Trouver les cours, les rapporter ici, et les traiter pour qu'ils soient propres dans un tableau :

price_not_arranged = []

price_not_arranged << page_1.css('a.price[1][1]').text

price_arranged = price_not_arranged[0].split("$")

# Trouver les noms, les rapporter ici, les traiter, les re-traiter pour qu'ils soient propres dans un tableau :

name_not_arranged = []

name_not_arranged << page_1.css('a.currency-name-container')

name_always_not_arranged = []

(name_not_arranged[0]).to_s.split('<a class="currency-name-container" href="/currencies/').each do |line|
  name_always_not_arranged << line
end

name_arranged = []

name_always_not_arranged.length.times do |i|
  if !(name_always_not_arranged[i].empty?) && name_always_not_arranged[i].index('/')
    name_arranged << name_always_not_arranged[i].slice(0..(name_always_not_arranged[i].index('/')-1))
  end
end

# Rangement au propre des 2 précédents tableaux dans un Hash propre :

name_and_price = {}

1562.times do |i|
  name_and_price[name_arranged[i]] = [price_arranged[i+1]]
end

def

print name_and_price

