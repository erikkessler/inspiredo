require 'rails_helper'

RSpec.describe "StaticPages", :type => :request do
  describe "landing page" do
    before :each do
      visit "/"
    end
    it "goes to learn" do
      click_link 'Learn More'
      expect(current_path).to be(learn_path)
    end

    it "goes to sign up" do
      click_link 'Sign Up'
      expect(current_path).to be(sign_up_path)
    end

    it "goes to sign in" do
      click_link 'Log In'
      expect(current_path).to be(sign_in_path)
    end

  end
end
