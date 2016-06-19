# encoding: utf-8
module BusTracker::Android::Actions::RouteplanActions
  def navigate_to_route_plan_screen
    @window.main_screen.await.directions
    @window.route_plan_screen.await
  end

  def enter_from(from)
    @window.route_plan_screen.await.enter_from
    @window.search_start_location_screen.await.enter_from from
  end

  def select_from(from)
    @window.search_start_location_screen.await.select_from from
    @window.route_plan_screen.await
  end

  def enter_to(to)
    @window.route_plan_screen.await.enter_to
    @window.search_destination_screen.await.enter_to to
  end

  def select_to(to)
    @window.search_destination_screen.await.select_to to
    @window.route_plan_screen.await
  end

  def plan_route
    @window.route_plan_screen.plan_route
  end
end
