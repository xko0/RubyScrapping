require_relative '../lib/ruby_scrapping'

describe "array_of_crypto gather cryptos and their actual values" do
  it "gather cryptos data from an url" do
    expect(cryptos_names).not_to be_nil
    expect(cryptos_names.include?("BTC")).to be true
    expect(cryptos_names.include?("LTC")).to be true
  end

  it "gather cryptos values data from an url" do
    expect(cryptos_values).not_to be_nil
  end

  it "create an array of hash fo names and values of cryptos" do
    expect(arrays_of_crypto).is_a? (Array)
    expect(arrays_of_crypto[1]).is_a? (Hash)
  end
end
