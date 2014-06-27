require "rails_helper"

describe Api::V1::ActivitiesController do
  describe "GET #index, valid user" do
    before :each do
      @mentor = create(:mentor)
      @student = create(:student)
      @contract = create(:contract)
      @activity = create(:activity)
      
    end

    it "returns activity key" do
      authWithUser(@student)
      get :index
      puts json
      expect(json).to have_key("activities")
      expect(json).to have_key("student_activities")
    end

    it "returns the activity" do
      @contract.activities << @activity
      @student.contracts << @contract
      authWithUser(@student)
      get :index
      puts json
      expect(json["activities"].length).to eq(1)
      expect(json["activities"][0]["name"]).to eq(@activity.name)
    end
  end

  describe "GET #index, invalid user" do
    it "returns unauthorized" do
      clearToken
      get :index
      expect(response.status).to eq(401)
    end
  end

  describe "PUT #update, valid user" do
    before :each do
      @mentor = create(:mentor)
      @student = create(:student)
      @contract = create(:contract)
      @activity = create(:activity)
      
    end

    it "updates activity" do
      @student.contracts << @contract
      @contract.activities << @activity
      authWithUser(@student)
      put :update, :id => @activity.id, :activity => { name: "Update Act" }
      puts json
      expect(json["activity"]["name"]).to eq("Update Act")
    end
  end
  
  describe "PUT #update, invalid user" do
    it "returns unauthorized" do
      @activity = create(:activity)
      clearToken
      put :update, :id => @activity.id, :activity => { name: "Update Act" }
      expect(response.status).to eq(401)
    end
  end

  describe "POST #create, valid user" do
    before :each do
      @mentor = create(:mentor)
      @student = create(:student)
      @contract = create(:contract)
    end

    it "creates activity" do
      @mentor.students << @student
      @student.contracts << @contract
      authWithUser(@mentor)
      post :create, :activity => { name: "Eat", contract_id: @contract.id }
      puts json
      expect(Activity.find_by_name("Eat")).to_not be_nil
    end
  end

  describe "POST #create, invalid user" do
    it "returns unauthorized" do
      @activity = create(:activity)
      clearToken
      post :create
      expect(response.status).to eq(401)
    end
  end
end
