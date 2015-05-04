require "spec_helper"

describe Lita::Handlers::TiqavHandler, lita_handler: true do
  it { is_expected.to route_command("tiqav ちくわ").to(:tiqav) }

  describe "search" do
    it "returns chikuwa image url" do
      send_message("tiqav ちくわ")
      expect(replies).to eq([ "http://img.tiqav.com/1aM.jpg" ])
    end
  end
end
