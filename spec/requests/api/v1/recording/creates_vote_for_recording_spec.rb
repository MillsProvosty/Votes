require "./spec/spec_helper"

describe "Create Recording Vote" do
  it "Creates a vote for a recording, with an id, and changes total score" do
    votable_id = 60
    votable_type = "Recording"
    user_token = "19384uksjehf"
    rating = 1

    post '/api/v1/Recording/60/create_vote/19384uksjehf/1'
    expect(last_response).to be_ok

    vote = JSON.parse(last_response.body, symbolize_names: true)

    expect(vote[:created_at].class).to eq(String)
    expect(vote[:votable_id]).to eq(60)
    expect(vote[:rating]).to eq(1)
    expect(vote[:user_token]).to eq("19384uksjehf")
    expect(vote[:votable_type]).to eq("Recording")
  end
end
