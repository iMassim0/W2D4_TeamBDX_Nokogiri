require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'yaml'

# Fonction pour récuperer UN SEUL email d'une page web issu du site annuaire-des-mairies.com sur le Val d'Oise

def get_the_email_of_a_townhal_from_its_webpage(url)

  page_1 = Nokogiri::HTML(open(url))

  return page_1.css('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text

end

# Fonction permettant de lister toutes les URL des pages des mairies du val d'Oise du site annuaire-des-mairies.com

def get_all_the_urls_of_val_doise_townhalls(url)

  page_2 = Nokogiri::HTML(open(url))

  temp_links = page_2.css("a.lientxt")

  temp_links

  townhall_links = {}

  temp_links.each do |link|

    email = get_the_email_of_a_townhal_from_its_webpage(link['href'].sub(/./, "http://annuaire-des-mairies.com"))

    townhall_links[camel_name((link.text))] = [link['href'].sub(/./, "http://annuaire-des-mairies.com"), email]

  end

  return townhall_links

end

def camel_name(a)
  if a.include?(" ")
    b = a.downcase!.split(" ")
    b[1..-1].each do |b|
    b = b.capitalize!
    end
  return b.join("")
  else
  return a.downcase!
  end
end

# Pour pouvoir se créer le fichier townhall_list.yml afin de fonctionner en local après cela ...
# url = "http://annuaire-des-mairies.com/val-d-oise.html"
# File.write('townhall_list.yml', YAML.dump(get_all_the_urls_of_val_doise_townhalls(url)))

townhall_list = YAML.load_file('townhall_list.yml')

choice = 0

until choice == 99 do

  puts "\nQue souhaitez-vous faire :"
  puts "1 : Afficher l'e-mail d'une mairie du Val d'Oise avec le nom"
  puts "2 : Afficher le lien du site internet d'une mairie du Val d'Oise avec le nom"
  puts "3 : Afficher tous les contacts e-mail des mairies du département du Val d'Oise"
  puts "4 : Afficher tous les liens web des mairies du département du Val d'Oise"
  puts "99 : Quitter le programme\n"

  choice = (gets.chomp).to_i

  if choice == 1

    print "Quelle est la ville : "
    ville = (gets.chomp).to_s
    camel_name(ville)
    puts townhall_list["#{ville}"][1]

  elsif choice == 2

    print "Quelle est la ville : "
    ville = (gets.chomp).to_s
    camel_name(ville)
    puts townhall_list["#{ville}"][0]

  elsif choice == 3

    townhall_list.each do |town, arr|

      puts "#{town} => #{arr[0]}"

    end

  elsif choice == 4

    townhall_list.each do |town, arr|

      puts "#{town} => #{arr[1]}"

    end

  end

end
