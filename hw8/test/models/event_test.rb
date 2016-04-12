require 'test_helper'

class EventTest < ActiveSupport::TestCase
    test 'can create new event' do
        user = users(:user1)
        
        event = Event.new(
            name: 'New Event',
            description: 'This is a new event.',
            start_date: Date.today,
            end_date: Date.today + 14
        )
        
        assert event.save
        
        event.owner = user
        
        assert event.save
        assert event.owner == user
        assert user.owned_events.include? event
    end
    
    test 'can associate a location to an event' do
        event = events(:event1)
        location = locations(:location1)
        
        event.locations << location
        
        assert event.locations.include? location
        assert location.events.include? event
    end
    
end