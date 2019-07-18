require "./spec/spec_helper"
# require "./app/controllers/application_controller"

describe "Vote Requests", type: :request do
  it "Gets ratings for a specific location" do

    get '/api/v1/recording/1/recording_rating'
binding.pry
    expect(last_response).to be_successful

    ratings = JSON.parse(last_response.body)

    expect(ratings).to eq("something")
  end
end
