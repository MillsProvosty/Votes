class VotesApp < Sinatra::Base
  set :root, File.expand_path("..",__dir__)

  get '/api/v1/recordings/:id/score' do
    # recording = VoteSerializer.new(Vote.score_for_recording_id(params[:id]))
    recording = Vote.score_for_recording_id(params[:id])
    recording.to_json
  end
end
