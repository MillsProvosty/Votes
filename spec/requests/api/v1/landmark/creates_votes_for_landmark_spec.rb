require "./spec/spec_helper"

describe "Create Landmark Vote" do
  it "Creates a vote for a landmark, with an id, and changes total score" do
    votable_id = 25
    votable_type = "Landmark"
    user_token = "19384uksjehf"
    rating = -1

    post '/api/v1/Landmark/25/create_vote/19384uksjehf/-1'

    expect(last_response).to be_ok

    vote = JSON.parse(last_response.body, symbolize_names: true)

    expect(vote[:created_at].class).to eq(String)
    expect(vote[:votable_id]).to eq(25)
    expect(vote[:rating]).to eq(-1)
    expect(vote[:user_token]).to eq("19384uksjehf")
    expect(vote[:votable_type]).to eq("Landmark")
  end
end
