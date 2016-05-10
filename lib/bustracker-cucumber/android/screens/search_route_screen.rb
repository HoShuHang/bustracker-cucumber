module BusTracker::Android::Screens
  class SearchRouteScreen < BusTracker::Screens::BaseScreen
    def initialize(world, opts = {})
      super(world)
      @keyboard = "* id:'keyboard_view0'"
    end

    def await(wait_opts = {})
      super wait_opts
    end

    def trait
      "* id:'action_bar' descendant * {text LIKE 'Search'}"
    end

    def traits
      [@keyboard]
    end

    def search(bus)
      bus.each_char do |num|
        btn = "* id:'keyboard_view0' descendant * {text LIKE '#{num}'}"
        touch_w btn
      end
    end
  end
end