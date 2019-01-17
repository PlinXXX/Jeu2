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

page = Nokogiri::HTML(open("https://google.com"))
puts page.xpath('//a')