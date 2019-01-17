#récupère les adresses emails des mairies du Val d'Oise. Comme pour l'exercice précédent, tu devras enregistrer les données dans une array de hash
require 'twitter'
require 'dotenv'
require 'nokogiri'
require 'open-uri'

  Dotenv.load

@client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
  config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end

page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

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
#puts "#{townhall_url[0].delete('.html')}.html"

=begin
def get_townhall_email(townhall_url)
	th_email = []
	townhall_url.each do |th_page|
		th_email_page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/#{townhall_url[0].delete('.html')}.html"))
		th_email = th_email_page.xpath('//tr/td')
	puts th_email
	end
end
get_townhall_email(townhall_url)
=end
puts "http://annuaire-des-mairies.com/#{townhall_url[0].tap {|s| s.slice(0)}}"