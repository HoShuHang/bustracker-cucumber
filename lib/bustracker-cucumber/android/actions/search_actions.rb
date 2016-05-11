# encoding: utf-8
module BusTracker::Android::Actions::SearchActions
  def navigate_to_search_route_screen
    @window.main_screen.await
    @window.main_screen.routes
    @window.search_route_screen.await
  end

  def search_bus(bus)
    @window.search_route_screen.search bus
  end

  def search_bus_by_type(bus, bus_type = '按鈕')
    @window.search_route_screen.click_search if bus_type == '輸入'
    @window.search_route_screen.search bus
  end

  def check_search_result(count)
    @window.search_route_screen.check_search_result count
  end
end
