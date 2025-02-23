require 'nokogiri'
require 'open-uri'

url="https://www.amazon.pl/s?k=#{ARGV[0]}"
uri = URI.parse(URI::Parser.new.escape(url))

doc = Nokogiri::HTML(URI.open(uri))

doc.xpath('//div[@role="listitem" and @data-component-type="s-search-result"]').each do |result|
  product = result.at_xpath('.//h2/span')&.text

  price = result.at_xpath('.//span[@class="a-price"]/span')&.text

  puts "Product: #{product}, price #{price}"
end
