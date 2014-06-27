require "rails_helper"

describe Api::V1::ContractsController do
  describe "GET #index, valid user" do
    before :each do
      @mentor = create(:mentor)
      @student = create(:student)
      @contract = create(:contract)
      @activity = create(:activity)
      
    end

    it "returns contracts key" do
      authWithUser(@student)
      get :index
      puts json
      expect(json).to have_key('contracts')
      expect(json).to have_key('student_contracts')
    end

    it "returns contracts of student" do
      authWithUser(@student)
      @student.contracts << @contract
      get :index
      puts json
      expect(json).to have_key('activities')
      expect(json["contracts"].length).to eq(1)
      expect(json["contracts"][0]["name"]).to eq(@contract.name)
    end

    it "returns activities of student" do
      authWithUser(@student)
      @contract.activities << @activity
      @student.contracts << @contract
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

  describe "POST #create, valid user" do
    before :each do
      @mentor = create(:mentor)
      @student = create(:student)
      @activity = create(:activity)
    end

    it "creates contract" do
      @mentor.students << @student
      authWithUser(@mentor)
      post :create, :contract => { name: "Sports", reward: "Nexus", user_id: @student.id }
      puts json
      expect(Contract.find_by_name("Sports")).to_not be_nil
    end
  end

  describe "POST #create, invalid user" do
    before :each do
      @mentor = create(:mentor)
      @student = create(:student)
      @contract = create(:contract)
      @activity = create(:activity)
    end

    it "when student id not a student" do
      @mentor.students << @student
      authWithUser(@mentor)
      post :create, :contract => { name: "Sports", reward: "Nexus", user_id: -1 }
      expect(Contract.find_by_name("Sports")).to be_nil
    end

    it "returns unauthorized" do
      clearToken
      post :create
      expect(response.status).to eq(401)
    end

  end
end
