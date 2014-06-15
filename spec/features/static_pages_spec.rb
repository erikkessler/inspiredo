require 'rails_helper'

RSpec.describe "StaticPages", :type => :request do
  describe "landing page" do
    before :each do
      visit "/"
    end
    it "goes to learn" do
      click_link 'Learn more'
      expect(current_path).to eq(learn_path)
    end

    it "goes to sign up" do
      click_link 'Sign up'
      expect(current_path).to eq(sign_up_path)
    end

    it "goes to sign in" do
      click_link 'Login'
      expect(current_path).to eq(sign_in_path)
    end

  end
end
