require 'rails_helper'

RSpec.describe "StaticPages", :type => :request do
  describe "GET root" do
    it "works! (now write some real specs)" do
      get root_path
      expect(response.status).to be(200)
    end
  end
end
