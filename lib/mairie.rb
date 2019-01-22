require 'open-uri'
require 'nokogiri'


def get_townhall_urls
  urls_townhall = []

  doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  doc.xpath('//*[@class="lientxt"]').each { |ele| urls_townhall << ele.values[1] }
  
  return urls_townhall.each { |url| url.delete_prefix!(".").insert(0, 'http://annuaire-des-mairies.com') }
end


def get_townhall_email(townhall_url)
  doc = Nokogiri::HTML(open(townhall_url))
  doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
end


def emails_townhall
  emails_townhall = []
  n = 0

  (get_townhall_urls.length).times do
    emails_townhall << get_townhall_email(get_townhall_urls[n])
    n += 1
  end

  return emails_townhall
end


def names_townhall
  names_townhall = []
  doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  doc.xpath('//*[@class="lientxt"]').each { |ele| names_townhall << ele.text }
  return names_townhall
end


def townhall_emails_scrapper
  array = []

  names = names_townhall
  emails = emails_townhall

  n = 0
  (names.length).times do
    array << Hash[names[n].to_s, emails[n].to_s]
    n += 1
  end
  
  return array
end

puts townhall_emails_scrapper