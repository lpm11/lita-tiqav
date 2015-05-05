require "spec_helper"

describe Lita::Handlers::Tiqav, lita_handler: true do
  it { is_expected.to route_command("tiqav").to(:tiqav_random) }
  it { is_expected.to route_command("tiqav ちくわ").to(:tiqav) }

  describe "search" do
    it "returns chikuwa image url" do
      send_message("tiqav ちくわ")
      expect(replies).to eq([ "http://img.tiqav.com/1aM.jpg" ])
    end
  end

  describe "random" do
    it "returns some image url" do
      send_message("tiqav")
      expect(replies[0]).to match(/^http:\/\/img\.tiqav\.com\//)
      expect(replies.size).to eq(1)
    end
  end
end
