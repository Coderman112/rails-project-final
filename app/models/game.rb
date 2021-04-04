class Game < ApplicationRecord

    validates :name, presence: true, uniqueness: true
    validate :is_title_case
    before_validation :make_title_case
    has_many :ratings
    has_many :users, through: :ratings