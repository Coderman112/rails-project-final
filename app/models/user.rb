class User < ApplicationRecord
    has_many :ratings
    has_many :games, through :ratings
    has_secure_password

    validates_uniqueness_of :username
    validates_presence_of :username

end