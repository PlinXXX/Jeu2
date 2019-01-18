#récupère les adresses emails des mairies du Val d'Oise. Comme pour l'exercice précédent, tu devras enregistrer les données dans une array de hash

require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
city_temp = page.xpath('//a[@class="lientxt"]')

def get_townhall_email(townhall_url)
	th_email = []
	for i in 0..4
		th_email_page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/#{townhall_url[i].tap {|s| s.slice!(0)}}"))
			all_td = th_email_page.xpath('//tbody/tr/td')
			th_email << all_td.grep(/.fr/)
	end
	th_email
end

townhall_url = []
townhall = []
th_email = []

city_temp.each do |link|
	townhall << link.text
	townhall_url << link['href']
end

#puts townhall
puts get_townhall_email(townhall_url)