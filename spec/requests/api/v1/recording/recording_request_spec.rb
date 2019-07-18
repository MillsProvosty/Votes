require "./spec/spec_helper"
# require "./app/controllers/application_controller"

describe "Vote Requests" do
  it "Gets ratings for a specific location" do

    get '/api/v1/recording/:id/recording_rating'

    expect(last_response).to be_ok

    ratings = JSON.parse(last_response.body, symbolize_name: true)
binding.pry
    expect(ratings).to eq("something")
  end
end
