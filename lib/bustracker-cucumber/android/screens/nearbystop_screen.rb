module BusTracker::Android::Screens
  class NearbystopScreen < BusTracker::Screens::BaseScreen
    def initialize(world, opts = {})
      super(world)
    end

    def await(wait_opts = {})
      super wait_opts
      @fragment_place = "* id:'fragment_place'"
      self
    end

    def trait
      "* id:'action_bar' descendant * {text LIKE 'Nearby'}"
    end

    def traits
      []
    end

    def search_location
      touch_w @fragment_place
    end

    def should_see_bus_stop
      text_stopname = "* id:'text_stopname'"
      text_destination = "* id:'text_destination'"
      text_routename = "* id:'text_routename'"
      wait_for_elements_exist [text_stopname, text_destination, text_routename]
    end

    def select_stop(stop)
      should_see_bus_stop
      touch_w "* {text CONTAINS '#{stop}'}"
    end
  end
end