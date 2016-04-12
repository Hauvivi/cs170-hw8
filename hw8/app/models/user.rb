class User < ActiveRecord::Base
    # event associations
    has_many :participates
    has_many :participating_events, through: :participates, source: 'event'
    has_many :owned_events, class_name: 'Event'
    
    # location associations
    has_many :visits
    has_many :visited_locations, through: :visits, source: 'location'
    has_many :owned_locations, class_name: 'Location'
end