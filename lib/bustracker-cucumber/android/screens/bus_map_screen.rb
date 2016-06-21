module BusTracker::Android::Screens
  class BusMapScreen < BusTracker::Screens::BaseScreen
    def initialize(world, opts = {})
      super(world)
      @fragment_map = "* id:'fragment_map'"
    end

    def await(wait_opts = {})
      super wait_opts
      self
    end

    def trait
      "* id:'action_bar'"
    end

    def traits
      [@fragment_map]
    end
  end
end