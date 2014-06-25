require 'rails_helper'

RSpec.describe "SignUps", :type => :request do
  describe "GET /sign_ups" do
    it "creates record when valid", js: true do
      visit sign_up_path
      fill_in "Email", :with => "cam@inspiredo.com"
      fill_in "Password", :with => "camcam"
      fill_in "Confirm Password", :with => "camcam"
      click_button "Sign Up"
      sleep 2
      user = User.find_by_email("cam@inspiredo.com")
      expect(user).not_to be_nil
      expect(user.is_mentor).to be(true)
      expect(user.is_student).to be(false)
    end

    it "creates no record when invalid", js: true do
      visit sign_up_path
      fill_in "Email", :with => "sam@inspiredo.com"
      fill_in "Password", :with => "camcam"
      fill_in "Confirm Password", :with => "camcamcam"
      click_button "Sign Up"
      user = User.find_by_email("sam@inspiredo.com")
      expect(user).to be(nil)
    end

    it "displays message when error", js: true do
      create(:user)
      visit sign_up_path
      fill_in "Email", :with => "cam@inspiredo.com"
      fill_in "Password", :with => "camcam"
      fill_in "Confirm Password", :with => "camcamcam"
      click_button "Sign Up"
      expect(page).to have_content("Email has already been taken")
      expect(page).to have_content("doesn't match")
    end
  end
end
