class Location < ActiveRecord::Base
    # event associations
    has_and_belongs_to_many :events
    
    # user associations
    has_many :visits
    has_many :visitors, through: :visits, source: 'user'
    belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
end