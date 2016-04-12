class Event < ActiveRecord::Base
    # location associations
    has_and_belongs_to_many :locations
    
    # user associations
    has_many :participates
    has_many :participants, through: :participates, source: 'user'
    belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
end