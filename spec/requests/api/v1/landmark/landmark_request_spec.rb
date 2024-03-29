require "./spec/spec_helper"

describe "Vote Requests" do
  it "Returns the upvotes, downvotes and total score for a specific landmark by id" do

    Vote.create(votable_id: 22, votable_type: "landmark", rating: -1, user_token: "12049oOwjhsfe")
    Vote.create(votable_id: 22, votable_type: "landmark", rating: 1, user_token: "348205wjgkdafe")
    Vote.create(votable_id: 3, votable_type: "landmark", rating: 1, user_token: "348205wjgkdafe")
    Vote.create(votable_id: 1, votable_type: "recording", rating: -1, user_token: "34jwer2orwjgkdafe")
    Vote.create(votable_id: 22, votable_type: "landmark", rating: -1, user_token: "3482adfjq3r8fe")

    get '/api/v1/landmark/22/score'

    expect(last_response).to be_ok

    ratings = JSON.parse(last_response.body, symbolize_names: true)

    expect(ratings[:data][:attributes][:upvotes]).to eq(1)
    expect(ratings[:data][:attributes][:downvotes]).to eq(2)
    expect(ratings[:data][:attributes][:total_score]).to eq(-1)
  end
end
