#récupére le cours de toutes les cryptomonnaies, et les enregistre bien proprement dans une array de hashs
require 'nokogiri'
require 'open-uri'

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

puts cname_price
