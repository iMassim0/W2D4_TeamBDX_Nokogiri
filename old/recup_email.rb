require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'yaml'

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

  puts "LOADING => OK"

  if CHOICE == 1


    puts "Rentrez le nom de votre ville du Val d'Oise :"
    puts "(ex : Vaureal)"
    ville = (gets.chomp).upcase
    list = [YAML.load_file('mairie_list.yml')]
      list.each do |info|
        if info[0] == ville
          puts info[1]
        end
      end

  elsif CHOICE == 2

    puts "Rentrez le nom de votre ville du Val d'Oise :"
    puts "(ex : Vaureal)"
    ville = (gets.chomp).upcase
    mairie_links.each do |key, value|
      if key == ville
        puts "\nVoici le lien : #{value}\n"
      end
    end

  elsif CHOICE == 3

    mairie_links.each do |key, value|
      puts "#{key} => #{value}"
    end

  elsif CHOICE == 4

    list = [YAML.load_file('mairie_list.yml')]

      # mairie_links.each do |key, url|
      #   list << key
      #   list << get_the_email_of_a_townhal_from_its_webpage(url)
      #    print url[0].length
      # end

    else
      print list[0]
    end

  end

end

puts "Bonjour"

puts "Chargement des données du site http://annuaire-des-mairies.com/val-d-oise.html en cours"

all_mairie_url = "http://annuaire-des-mairies.com/val-d-oise.html"

CHOICE = 0

until CHOICE == 99 do





  if CHOICE == 1

    get_all_the_urls_of_val_doise_townhalls(all_mairie_url)

  elsif CHOICE == 2

    get_all_the_urls_of_val_doise_townhalls(all_mairie_url)

  elsif CHOICE == 3

    get_all_the_urls_of_val_doise_townhalls(all_mairie_url)


  elsif CHOICE == 4

    get_all_the_urls_of_val_doise_townhalls(all_mairie_url)


  end



  puts "\nQue souhaitez-vous faire :"
  puts "1 : Afficher l'e-mail d'une mairie du Val d'Oise avec le nom"
  puts "2 : Afficher le lien du site internet d'une mairie du Val d'Oise\n(car toutes les url ont été chargées au début du programme)"
  puts "3 : Afficher tous les liens du département du Val d'Oise"
  puts "4 : Afficher tous les mails du département du Val d'Oise"
  puts "99 : Quitter le programme"

    CHOICE = (gets.chomp).to_i

end


