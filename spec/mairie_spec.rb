require_relative '../lib/townhall'


describe "#townhall_emails_scrapper" do
  it "should return 185 townhalls" do
    expect(townhall_emails_scrapper.length).to eq(185) 
  end

  it "should include GOUSSAINVILLE, BUHY and OSNY" do
    expect(names_townhall).to include('GOUSSAINVILLE')
    expect(names_townhall).to include('BUHY')
    expect(names_townhall).to include('OSNY')
  end

  it "should not be nil nor null" do
    expect(townhall_emails_scrapper[10]).not_to be_nil
    expect(townhall_emails_scrapper[10]).not_to eq('')
    expect(townhall_emails_scrapper[50]).not_to be_nil
    expect(townhall_emails_scrapper[50]).not_to eq('')
    expect(townhall_emails_scrapper[100]).not_to be_nil
    expect(townhall_emails_scrapper[100]).not_to eq('')
  end
end