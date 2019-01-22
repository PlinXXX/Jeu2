require_relative '../lib/trader'


describe "#crypto_scrapper" do
  it "should return at least 2000 cryptocurrencies" do
    expect(crypto_scrapper.length).to be > 2000
  end

  it "should include BTC, ETH and XMR..." do
    expect(scrapping_currencies).to include('BTC')
    expect(scrapping_currencies).to include('ETH')
    expect(scrapping_currencies).to include('XMR')
  end

  it "the prices should not be nil nor null" do
    expect(scrapping_prices[10]).not_to be_nil
    expect(scrapping_prices[10]).not_to eq('$0')
    expect(scrapping_prices[100]).not_to be_nil
    expect(scrapping_prices[100]).not_to eq('$0')
    expect(scrapping_prices[1000]).not_to be_nil
    expect(scrapping_prices[1000]).not_to eq('$0')
  end
end