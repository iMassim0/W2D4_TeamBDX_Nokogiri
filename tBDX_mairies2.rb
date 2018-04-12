require 'rubygems'
require 'nokogiri'
require 'open-uri'

# Lien vers la page ou récup des données
page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

# Récupérer les infos des liens, sous class='lientxt'
temp_links = page.css("a.lientxt")

# créa array final
mairie_links = []

# Traiter les liens récup temporairement en remplacant . par http://annuaire-des-mairies.com
temp_links.each{|link| mairie_links << "#{link['href'].sub(/./, "http://annuaire-des-mairies.com")}"}

# Affich les liens de la mairie
# puts mairie_links

# Affiche le lien de Vauréal
puts mairie_links[172]
