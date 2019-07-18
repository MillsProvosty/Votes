class VotesApp < Sinatra::Base
  set :root, File.expand_path("..",__dir__)

  get '/api/v1/recording/:id/recording_rating' do
    recording = RecordingSerializer.new(Category.recording_rating)
    recording.to_json
  end
end
