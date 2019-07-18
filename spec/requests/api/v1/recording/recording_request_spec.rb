require "./spec/spec_helper"
# require "./app/controllers/application_controller"

describe "Vote Requests" do
  it "Gets ratings for a specific location" do
    
    get '/api/v1/recording/:id/recording_rating'
    binding.pry
    expect(last_response).to be_ok

    ratings = JSON.parse(last_response.body)

    expect(ratings).to eq("something")
  end
end
