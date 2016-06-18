# encoding: utf-8
module BusTracker::Android::Actions::NearbystopActions
  def navigate_to_nearbystop_screen
    @window.main_screen.await
    @window.main_screen.nearby
    @window.nearbystop_screen.await
  end

  def enter_search_location_screen
    @window.nearbystop_screen.await.search_location
    @window.search_location_screen.await
  end

  def enter_select_destination_screen
    @window.nearbystop_screen.await.select_destination
    @window.select_destination_screen.await
  end

  def search_destination(stop)
    @window.select_destination_screen.await.search_destination stop
  end

  def search_location(location)
    @window.search_location_screen.search location
  end

  def select(location)
    @window.search_location_screen.select location
    @window.nearbystop_screen.await
  end

  def select_stop(stop)
    @window.nearbystop_screen.select_stop stop
  end

  def select_destination(stop)
    @window.select_destination_screen.select_destination stop
    should_see_bus_stop
  end

  def cancel_search
    @window.search_location_screen.await.cancel_search
  end

  def cancel_search_destination
    @window.select_destination_screen.cancel_search_destination
  end

  def delete_search_location_history
    @window.search_location_screen.await.delete_search_location_history
  end

  def should_see_bus_stop
    @window.nearbystop_screen.await.should_see_bus_stop
  end

  def should_see_bus_status
    @window.bus_status_screen.await
  end

  def should_see_location_in_search_location_history(location)
    @window.search_location_screen.should_see_location_in_search_location_history location
  end
end
