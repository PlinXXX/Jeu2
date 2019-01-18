#récupère les adresses emails des mairies du Val d'Oise. Comme pour l'exercice précédent, tu devras enregistrer les données dans une array de hash
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

def get_townhall_email(townhall_url)
	th_email = []
	townhall_url.each do |th_page|
		th_email_page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/#{th_page.tap {|s| s.slice!(0..1)}}"))
		all_td = th_email_page.xpath('//tbody/tr/td')
		th_email << all_td.grep(/.fr/)
	end
	puts th_email
end

city_temp = page.xpath('//a[@class="lientxt"]')

townhall_url = []
city = []

=begin
city_temp.each do |c|
	city << c.text
end
=end

city_temp.each do |link|
	townhall_url << link['href']
end

get_townhall_email(townhall_url)