# encoding: utf-8
module BusTracker::Android::Actions::MainActions
  def navigate_to_main_screen
    @window.main_screen.await
  end
end
