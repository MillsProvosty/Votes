require "./spec/spec_helper"
# require "./app/controllers/application_controller"

describe "Vote Requests" do
  it "Gets a specific recording by id" do

    @vote1 = Vote.create(votable_id: 1, votable_type: "Recording", rating: -1, user_token: "12049oOwjhsfe")
    @vote2 = Vote.create(votable_id: 1, votable_type: "Recording", rating: 1, user_token: "348205wjgkdafe")
    @vote3 = Vote.create(votable_id: 2, votable_type: "Recording", rating: 1, user_token: "348205wjgkdafe")
    @vote4 = Vote.create(votable_id: 1, votable_type: "Landmark", rating: -1, user_token: "34jwer2orwjgkdafe")
    @vote5 = Vote.create(votable_id: 1, votable_type: "Recording", rating: -1, user_token: "3482adfjq3r8fe")

    get '/api/v1/recordings/1/score'

    expect(last_response).to be_ok

    ratings = JSON.parse(last_response.body, symbolize_names: true)

    expect(ratings[:data][:attributes][:upvotes]).to eq(1)
    expect(ratings[:data][:attributes][:downvotes]).to eq(2)
    expect(ratings[:data][:attributes][:total_score]).to eq(-1)
  end
end
