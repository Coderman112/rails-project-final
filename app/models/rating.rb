class Rating < ApplicationRecord
    belongs_to :game
    belongs_to :user
    validates_presence_of :score

    scope(:score_search, ->(score) { self.where("score >= ?", score) })

end