class RecordingsController < ApplicationController
  get '/api/v1/recording/1/recording_rating' do
    content_type :json
   { :key1 => 'value1', :key2 => 'value2' }.to_json
  end
end