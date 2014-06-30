require "rails_helper"

describe Api::V1::FeedItemsController do
  describe "GET #index, valid user" do
    before :each do
      @mentor = create(:mentor)
      @student = create(:student)
      @contract = create(:contract)
      @activity = create(:activity)
      @feed_item = create(:feed_item)
      @student.feed_items << @feed_item
      
    end

    it "returns activity key" do
      authWithUser(@student)
      get :index
      puts json
      expect(json).to have_key("feed_items")
    end

    it "returns the activity" do
      authWithUser(@student)
      get :index
      puts json
      expect(json["feed_items"].length).to eq(1)
      expect(json["feed_items"][0]["content"]).to eq(@feed_item.content)
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
      @contract = create(:contract)
    end

    it "creates activity" do
      @mentor.students << @student
      @student.contracts << @contract
      authWithUser(@student)
      post :create, :feed_item => { content: "Eat", user_id: @student.id }
      puts json
      expect(FeedItem.find_by_content("Eat")).to_not be_nil
    end
  end

  describe "POST #create, invalid user" do
    it "returns unauthorized" do
      clearToken
      post :create
      expect(response.status).to eq(401)
    end
  end
end
