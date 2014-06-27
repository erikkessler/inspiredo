require "rails_helper"

describe Api::V1::StudentsController do
  describe "GET #index, valid user" do
    before :each do
      @mentor = create(:mentor)
      authWithUser(@mentor)
      @student = create(:student)
      @contract = create(:contract)
      @activity = create(:activity)
    end

    it "returns students key" do
      get :index
      puts json
      expect(json).to have_key('students')
      expect(json).to have_key('mentor_students')
    end

    it "returns students" do
      @mentor.students << @student
      get :index
      puts json
      expect(json["students"].length).to eq(1)
      expect(json["students"][0]["email"]).to eq(@student.email)
      expect(json).to have_key('contracts')
    end

    it "returns contracts" do
      @student.contracts << @contract
      @mentor.students << @student
      get :index
      puts json
      expect(json["contracts"].length).to eq(1)
      expect(json["contracts"][0]["name"]).to eq(@contract.name)
      expect(json).to have_key('activities')
    end

    it "returns activities" do
      @contract.activities << @activity
      @student.contracts << @contract
      @mentor.students << @student
      get :index
      puts json
      expect(json["activities"].length).to eq(1)
      expect(json["activities"][0]["name"]).to eq(@activity.name)
      expect(json.length).to eq(4)
    end

    describe "GET #index, invalid user" do
      it "returns unauthorized" do
        clearToken
        get :index
        expect(response.status).to eq(401)
      end
    end
    
  end
end
