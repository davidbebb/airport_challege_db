require 'weather'


describe 'The weather' do
  let(:dummy_class) { Class.new { extend Weather } }

  it 'reports stormy or sunny' do
    expect(dummy_class.report_weather).to eq(:sunny).or eq(:stormy)
  end

end
