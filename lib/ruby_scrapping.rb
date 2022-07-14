require 'rubygems'
require 'nokogiri'
require 'open-uri'

def url
	page = doc = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))
end

def cryptos_names
	page = url
	cryptos = []
page.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody //div/a[contains(@class, "cmc-table__column-name--symbol")]').each do |node|
	cryptos.push(node.text)
	cryptos
	end
	return cryptos
end

def cryptos_values
	page = url
	values = []
	page.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody //tr/td[contains(@class, "cmc-table__cell--sort-by__price")]').each do |node|
		values.push(node.text[1..-1].gsub(/[^\d^.]/,'').to_f)
	end
	return values
end

def arrays_of_crypto
	cryptos = cryptos_names
	values = cryptos_values
	final_array = cryptos.zip(values).map{|k, v| {k => v}}
	return final_array
end

