require 'test_helper'

class LocationsControllerTest < ActionController::TestCase
    test 'can view all locations' do
        get show_all_locations_path, { controller: :locations, action: :show_location_path }
        assert_template 'locations/show_all_locations'
    end
    
    test 'can view a single location' do
        location = locations(:location1)
        get show_location_path(location), { controller: :locations, action: :show_location_path }
        assert_template 'locations/show_location'
    end
end