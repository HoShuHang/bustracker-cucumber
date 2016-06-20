# encoding: utf-8
module BusTracker::Android::Actions::FavoriteActions
  def navigate_to_favorites_screen
    @window.main_screen.await.routes
    @window.favorites_screen.await
  end

  def add_to_group(stop, group=nil)
    @window.realtime_bus_information_screen.add_to_group(stop, group)
  end

  def add_all_to_group
    @window.bus_stop_screen.await.add_all_to_group
  end

  def switch_to_group(group)
    @window.favorites_screen.await.switch_to_group(group)
  end
end
