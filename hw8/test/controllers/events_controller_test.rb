require 'test_helper'

class EventsControllerTest < ActionController::TestCase
    test 'can view all events' do
        get show_all_events_path, { controller: :events, action: :show_event_path }
        assert_template 'events/show_all_events'
    end
    
    test 'can view a single event' do
        event = events(:event1)
        get show_event_path(event), { controller: :events, action: :show_event_path }
        assert_template 'events/show_event'
    end
end