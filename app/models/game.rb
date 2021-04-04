class Game < ApplicationRecord

    validates :name, presence: true, uniqueness: true
    validate :is_title_case
    before_validation :make_title_case
    has_many :ratings
    has_many :users, through: :ratings


    def ratings_attributes=(attrs)
        attrs.values.each do |hash|
            if hash[:id]
                r = Rating.find_by(id: hash[:id])
                r.update(hash)
            else
                self.ratings.build(hash)
            end
        end
    end



    def is_title_case
        if self.name != self.name.titlecase
            self.errors.add(:name, "must be titlecase")
        end
    end

    def make_title_case
        self.name = self.name.titlecase
    end

end