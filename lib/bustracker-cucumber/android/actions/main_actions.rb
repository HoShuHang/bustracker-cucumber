# encoding: utf-8
module BusTracker::Android::Actions::MainActions
  def navigate_to_main_screen
    @window.main_screen.await
  end

  def navigate_to_routes_screen
    @window.main_screen.await.routes
    @window.routes_screen.await
  end

  def navigate_to_nearby_screen
    @window.main_screen.await.nearby
    @window.nearby_screen.await
  end

  def navigate_to_directions_screen
    @window.main_screen.await.directions
    @window.directions_screen.await
  end

  def navigate_to_favorites_screen
    @window.main_screen.await.favorites
    @window.favorites_screen.await
  end
end
