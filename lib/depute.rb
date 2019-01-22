require 'open-uri'
require 'nokogiri'


def get_url
  urls = []

  doc = Nokogiri::HTML(open("https://www.nosdeputes.fr/deputes"))
  doc.xpath('//div[@class="list_table"]//a/@href').each { |ele| urls << ele.to_s}

  return urls.each { |url| url.insert(0, "https://www.nosdeputes.fr")}
end


def get_name
  names = []

  doc = Nokogiri::HTML(open("https://www.nosdeputes.fr/deputes"))
  doc.xpath('//span[@class="list_nom"]').each { |ele| names << ele.text.delete!(',').split }

  return names
end


def get_email
  urls = get_url
  names = get_name
  emails = []
  n = 0

  (urls.length).times do
    doc = Nokogiri::HTML(open(urls[n]))
    doc.xpath('//a[contains(text(),"@assemblee")]').each { |email| emails << email.text }
    n += 1
  end
  emails = emails.delete_if { |email| email.include? 'bureau-m' }
  return emails.delete_if { |email| email.include? 'secretariat' }
end


def email_depute_scrapper
  array = []

  names = get_name  
  emails = get_email
  n = 0

  begin
    (emails.length).times do
      array << Hash["fist_name", names[n][1], "last_name", names[n][0], "email", emails[n].to_s]
      n += 1
    end
  rescue => e
  	
  end

  return array
end

puts email_depute_scrapper
