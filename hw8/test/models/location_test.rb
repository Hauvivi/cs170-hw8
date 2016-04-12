require 'test_helper'

class LocationTest < ActiveSupport::TestCase
    test 'can create new location' do
        user = users(:user1)

        location = Location.new(
            name: 'New Location',
            description: 'This is a new location.'
        )
        
        assert location.save

        location.owner = user 
        
        assert location.save
        assert location.owner == user
        assert user.owned_locations.include? location
    end
end