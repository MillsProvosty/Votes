class Vote < ActiveRecord::Base
  validates_presence_of :votable_type,
                        :votable_id,
                        :rating,
                        :user_token

  enum votable_type: ["landmark", "recording"]

  def self.create_vote(attributes)
    new_vote = Vote.create(attributes)
    new_vote.save
    return new_vote
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
end
