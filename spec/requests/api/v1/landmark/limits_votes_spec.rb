require "./spec/spec_helper"

describe "User can only vote once" do
  it "then update is called" do

    Vote.create(votable_id: 60, votable_type: "landmark", rating: 1, user_token: "12345")

    Vote.create(votable_id: 60, votable_type: "landmark", rating: 1, user_token: "9834u")
    Vote.create(votable_id: 60, votable_type: "landmark", rating: 1, user_token: "123045u")
    Vote.create(votable_id: 60, votable_type: "landmark", rating: 1, user_token: "0923nf")
    Vote.create(votable_id: 60, votable_type: "landmark", rating: -1, user_token: "re3nf")
    Vote.create(votable_id: 60, votable_type: "landmark", rating: -1, user_token: "23f3nf")

    Vote.create(votable_id: 25, votable_type: "landmark", rating: 1, user_token: "12345")
    Vote.create(votable_id: 1, votable_type: "landmark", rating: 1, user_token: "12345")
    Vote.create(votable_id: 94, votable_type: "landmark", rating: -1, user_token: "12345")

    get '/api/v1/landmark/60/score'

    expect(last_response).to be_ok

    original_vote = JSON.parse(last_response.body, symbolize_names: true)

    expect(original_vote[:data][:attributes][:upvotes]).to eq(4)
    expect(original_vote[:data][:attributes][:downvotes]).to eq(2)
    expect(original_vote[:data][:attributes][:total_score]).to eq(2)

    post '/api/v1/landmark/60/create_vote/12345/-1'


    get '/api/v1/landmark/60/score'

    expect(last_response).to be_ok

    updated_vote = JSON.parse(last_response.body, symbolize_names: true)

    expect(updated_vote[:data][:attributes][:upvotes]).to eq(3)
    expect(updated_vote[:data][:attributes][:downvotes]).to eq(3)
    expect(updated_vote[:data][:attributes][:total_score]).to eq(0)
  end
end
