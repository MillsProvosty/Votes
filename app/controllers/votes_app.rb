class VotesApp < Sinatra::Base
  set :root, File.expand_path("..",__dir__)

  get '/api/v1/recordings/:id/score' do
    # recording = VoteSerializer.new(Vote.score_for_recording_id(params[:id]))
    scores = Vote.score_for_recording_id(params[:id])
    VoteSerializer.render(scores, params[:id], "Recording").to_json
  end
end
