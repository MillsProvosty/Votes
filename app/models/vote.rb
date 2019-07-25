class Vote < ActiveRecord::Base
  validates_presence_of :votable_type,
                        :votable_id,
                        :rating,
                        :user_token

  enum votable_type: ["landmark", "recording"]

  def self.check_previous(params)
    vote_exists?(params)
  end


  def self.score_for_id_and_type(attributes)
    upvotes = relevant_votes(attributes[:votable_id], attributes[:votable_type]).where(rating: 1).count
    downvotes = relevant_votes(attributes[:votable_id], attributes[:votable_type]).where(rating: -1).count

    {upvotes: upvotes, downvotes: downvotes}
  end

  def self.relevant_votes(votable_id, votable_type)
    self.where(votable_type: votable_type, votable_id: votable_id)
  end

  def self.update_vote(vote_id, rating)
    vote = Vote.find(vote_id)
    vote[:rating] = rating
    vote.save
    return vote
  end

  def self.vote_exists?(params)
    object_id = params["votable_id"]
    user = params["user_token"]
    type = params["votable_type"]

    vote_id = select("votes.*").where(user_token: user, votable_id: object_id, votable_type: type)
    if vote_id.count == 0
      Vote.create(params)
    else
      id = vote_id.first[:id]
      rating = 0
      self.update_vote(id, rating)
    end
  end
end
