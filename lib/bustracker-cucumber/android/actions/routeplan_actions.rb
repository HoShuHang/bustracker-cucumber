# encoding: utf-8
module BusTracker::Android::Actions::RouteplanActions
  def navigate_to_route_plan_screen
    @window.main_screen.await.directions
    @window.route_plan_screen.await
  end

  def navigate_to_search_start_location_screen
    @window.route_plan_screen.await.enter_from
    @window.search_start_location_screen.await
  end

  def navigate_to_search_destination_screen
    @window.route_plan_screen.await.enter_to
    @window.search_destination_screen.await
  end

  def enter_from(from)
    navigate_to_search_start_location_screen
    @window.search_start_location_screen.enter_from from
  end

  def select_from(from)
    @window.search_start_location_screen.await.select_from from
    @window.route_plan_screen.await
  end

  def enter_to(to)
    navigate_to_search_destination_screen
    @window.search_destination_screen.enter_to to
  end

  def delete_from_history
    @window.search_start_location_screen.await.delete_from_history
  end

  def delete_to_history
    @window.search_destination_screen.await.delete_to_history
  end

  def select_to(to)
    @window.search_destination_screen.await.select_to to
    @window.route_plan_screen.await
  end

  def switch_from_to
    @window.route_plan_screen.await.switch_from_to
  end

  def plan_route
    @window.route_plan_screen.plan_route
  end

  def plan_transport(transport)
    @window.route_plan_screen.plan_transport [transport]
  end

  def plan_route_error
    @window.route_plan_screen.plan_route_error
  end

  def set_plan_time(hr, min)
    @window.route_plan_screen.set_plan_time(hr, min)
  end
end
