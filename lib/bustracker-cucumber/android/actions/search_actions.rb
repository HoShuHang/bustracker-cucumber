# encoding: utf-8
module BusTracker::Android::Actions::SearchActions
  def navigate_to_search_route_screen
    @window.main_screen.await
    @window.main_screen.routes
    @window.search_route_screen.await
  end

  def search_bus_by_type(bus, bus_type = '按鈕')
    @window.search_route_screen.search bus, bus_type
  end

  def enter_in_search_bar(bus)
    @window.search_route_screen.search bus, '輸入', { edit: true }
  end

  def check_search_result(count)
    @window.search_route_screen.check_search_result count
  end

  def enter_search_result(index)
    bus = @window.search_route_screen.enter_search_result index
    @window.realtime_bus_information_screen.await(bus: bus)
  end

  def select_stop(stop)
    @window.realtime_bus_information_screen.await.select_stop(stop)
  end

  def should_see_outbound_bus_status
    @window.realtime_bus_information_screen.should_see_outbound_bus_status
  end

  def should_see_inbound_bus_status
    @window.realtime_bus_information_screen.should_see_inbound_bus_status
  end

  def cancel_input
    @window.search_route_screen.cancel_input
  end

  def reset_search_route
    @window.search_route_screen.reset_search_route
  end

  def modify_search_route
    @window.search_route_screen.delete_input_text
    search_bus_by_type '0'
  end

  def watch_info
    @window.realtime_bus_information_screen.await.watch_info
    @window.route_info_screen.await
  end

  def set_get_on_alarm
    @window.realtime_bus_information_screen.set_get_on_alarm
  end

  def from_route_info_screen_back_to_realtime_bus_information_screen
    @window.route_info_screen.await.back
  end

  def select_watch_info
    @window.realtime_bus_information_screen.select_watch_info
    @window.route_info_screen.await
  end

  def check_search_empty
    @window.search_route_screen.await.check_search_empty
  end

  def search_all_pass_by(stop)
    @window.realtime_bus_information_screen.await.search_all_pass_by stop
    @window.bus_stop_screen.await
  end

  def watch_bus_map
    @window.realtime_bus_information_screen.watch_bus_map
    @window.bus_map_screen.await
  end

  def check_search_route_result(bus)
    @window.search_route_screen.check_search_route_result(bus)
  end
end
