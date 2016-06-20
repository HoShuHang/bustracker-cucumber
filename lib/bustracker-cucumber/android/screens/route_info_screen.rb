module BusTracker::Android::Screens
  class RouteInfoScreen < BusTracker::Screens::BaseScreen
    def initialize(world, opts = {})
      super(world)
      @back = "* id:'action_bar_container' descendant * contentDescription:'Navigate up'"
    end

    def await(wait_opts = {})
      super wait_opts
      self
    end

    def trait
      "* id:'action_bar' descendant * {text LIKE 'Route info'}"
    end

    def traits
      [@back]
    end

    def back
      touch_w @back
    end
  end
end