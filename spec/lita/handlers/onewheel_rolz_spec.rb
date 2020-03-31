require 'spec_helper'

def mock_fixture(fixture)
  mock = File.open("spec/fixtures/#{fixture}.wat").read
  allow(RestClient).to receive(:get) { mock }
end

describe Lita::Handlers::OnewheelRolz, lita_handler: true do
  it { is_expected.to route_command('roll') }
  it { is_expected.to route_command('roll d20') }
  it { is_expected.to route_command('roll 6d20') }

  it 'gets a d20 roll' do
    mock_fixture('d20')
    send_command ('roll d20')
    expect(replies.last).to eq('You rolled a 6!')
  end

  it 'gets a d20 roll of 1' do
    mock_fixture('d20_1')
    send_command ('roll d20')
    expect(replies.last).to eq('You rolled a 1!  And you dropped your keyboard.')
  end

  it 'gets a 6d6 roll' do
    mock_fixture('6d6')
    send_command ('roll 6d6')
    expect(replies.last).to eq('You rolled a 20!')
  end

  it 'gets a 6d6 roll of 1' do
    mock_fixture('d6_1')
    send_command ('roll d6')
    expect(replies.last).to eq('You rolled a 1!')
  end

  it 'rolls default' do
    mock_fixture('d20_17')
    send_command ('roll')
    expect(replies.last).to eq('You rolled a 17!')
  end

  it 'rolls a 20!' do
    mock_fixture('d20_20')
    send_command ('roll d20')
    expect(replies.last).to eq('You rolled a 20!  Critical hit!')
  end
end
