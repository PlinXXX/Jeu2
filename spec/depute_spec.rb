require_relative '../lib/député'


describe "#email_depute_scrapper" do
  it "should return 577 congressmen" do
    expect(get_name.length).to eq(577) 
  end

  it "should not be nil nor null" do
    expect(email_depute_scrapper[10]).not_to be_nil
    expect(email_depute_scrapper[10]).not_to eq('')
    expect(email_depute_scrapper[100]).not_to be_nil
    expect(email_depute_scrapper[100]).not_to eq('')
    expect(email_depute_scrapper[500]).not_to be_nil
    expect(email_depute_scrapper[500]).not_to eq('')
  end
end