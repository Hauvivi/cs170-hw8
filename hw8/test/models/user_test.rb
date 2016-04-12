require 'test_helper'

class UserTest < ActiveSupport::TestCase
    test 'can create new user' do
        User.create(
            first_name: 'New',
            last_name: 'User',
            email: 'new@user.com'
        )
        
        assert_not User.all.empty?
    end
    
    test 'can join an event' do
        event = events(:event1)
        user = users(:user1)
        
        event.participants << user
        
        assert event.participants.include? user
        assert user.participating_events.include? event
    end
    
    test 'can visit a location' do
        location = locations(:location1)
        user = users(:user1)
        
        user.visited_locations << location
        
        assert user.visited_locations.include? location
        assert location.visitors.include? user
    end
end