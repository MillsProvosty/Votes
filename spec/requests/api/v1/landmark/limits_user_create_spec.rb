require "./spec/spec_helper"

describe "User can only vote once" do
  it "then update is called" do

    Vote.create(votable_id: 22, votable_type: "recording", rating: 1, user_token: "12345")
    #user votes 1
    Vote.create(votable_id: 22, votable_type: "recording", rating: 1, user_token: "9834u")
    Vote.create(votable_id: 22, votable_type: "recording", rating: 1, user_token: "123045u")
    Vote.create(votable_id: 22, votable_type: "recording", rating: 1, user_token: "0923nf")
    Vote.create(votable_id: 22, votable_type: "recording", rating: -1, user_token: "re3nf")
    Vote.create(votable_id: 22, votable_type: "recording", rating: -1, user_token: "23f3nf")
    #should be 4
    Vote.create(votable_id: 25, votable_type: "recording", rating: 1, user_token: "12345")
    Vote.create(votable_id: 1, votable_type: "recording", rating: 1, user_token: "12345")
    Vote.create(votable_id: 94, votable_type: "recording", rating: -1, user_token: "12345")


    post '/api/v1/recording/22/create_vote/12345/1'

    get '/api/v1/recording/22/score'

    expect(last_response).to be_ok

    update = JSON.parse(last_response.body, symbolize_names: true)

    expect(update[:data][:attributes][:upvotes]).to eq(3)
    expect(update[:data][:attributes][:downvotes]).to eq(2)
    expect(update[:data][:attributes][:total_score]).to eq(1)
  end
end
