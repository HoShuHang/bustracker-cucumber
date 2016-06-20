# encoding: utf-8
module BusTracker::Android::Actions::FavoriteActions
  def add_to_group(stop)
    @window.realtime_bus_information_screen.add_to_group_to_default(stop)
  end
end
