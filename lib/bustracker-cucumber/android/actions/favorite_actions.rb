# encoding: utf-8
module BusTracker::Android::Actions::FavoriteActions
  def add_to_group(stop, group=nil)
    @window.realtime_bus_information_screen.add_to_group(stop, group)
  end

  def add_all_to_group
  end
end
