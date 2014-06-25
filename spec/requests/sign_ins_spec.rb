require 'rails_helper'

RSpec.describe "SignIns", :type => :request do
  describe "GET /sign_ins" do
    it "signs in when valid", js: true do
      visit sign_up_path
      sleep 3
      fill_in "Email", :with => "bam@bam.com"
      fill_in "Password", :with => "camcam"
      fill_in "Confirm Password", :with => "camcam"
      click_button "Sign Up"
      sleep 2
      fill_in "Email", :with => "bam@bam.com"
      fill_in "Password", :with =>"camcam"
      click_button "Login"
      sleep 2
      expect(current_path).to eq(dashboard_path)
    end
  end
end
