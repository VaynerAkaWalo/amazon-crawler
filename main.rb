require 'nokogiri'
require 'open-uri'

url='https://www.amazon.pl/s?k=iphone&rh=n%3A20788252031&__mk_pl_PL=ÅMÅŽÕÑ&ref=nb_sb_noss'
uri = URI.parse(URI::Parser.new.escape(url))

doc = Nokogiri::HTML(URI.open(uri))

doc.css('[data-component-type="s-search-result"]').each do |result|
  product = result.at_css('a > h2 > span')&.text

  price = result.at_css('.a-offscreen')&.text

  puts "Product: #{product}, price #{price}"
end
