class VotesApp < Sinatra::Base
  set :root, File.expand_path("..",__dir__)

  get '/api/v1/recording/:id/' do
    recording = RecordingSerializer.new(Recording.find(params[:id]))
    recording.to_json
  end
end
