#récupére le cours de toutes les cryptomonnaies, et les enregistre bien proprement dans une array de hashs
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

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

cname_temp = page.xpath('//a[@class="currency-name-container link-secondary"]')
price_temp = page.xpath('//a[@class="price"]')

cname = []
price = []

cname_temp.each do |n|
	cname << n.text
end
price_temp.each do |p|
	price << p.text.delete('$')
end

cname_price = Hash[cname.zip(price)]
puts "cname : #{cname.length}"
puts "price : #{price.length}"
puts cname_price
