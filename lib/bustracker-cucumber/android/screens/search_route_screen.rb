module BusTracker::Android::Screens
  class SearchRouteScreen < BusTracker::Screens::BaseScreen
    def initialize(world, opts = {})
      super(world)
    end

    def await(wait_opts = {})
      super wait_opts
    end

    def trait
      "* id:'action_bar' descendant * {text LIKE 'Search'}"
    end

    def traits
      []
    end
  end
end