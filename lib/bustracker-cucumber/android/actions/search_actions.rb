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
end
