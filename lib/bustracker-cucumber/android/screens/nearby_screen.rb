module BusTracker::Android::Screens
  class NearbyScreen < BusTracker::Screens::BaseScreen
    def initialize(world, opts = {})
      super(world)
    end

    def await(wait_opts = {})
      super wait_opts
    end

    def trait
      "* id:'action_bar_container' descendant * {text LIKE 'Nearby'}"
    end

    def traits
      []
    end
  end
end