module BusTracker::Android::Screens
  class FavoritesScreen < BusTracker::Screens::BaseScreen
    def initialize(world, opts = {})
      super(world)
    end

    def await(wait_opts = {})
      super wait_opts
      self
    end

    def trait
      "* id:'action_bar' descendant * {text LIKE 'Favorites'}"
    end

    def traits
      []
    end

    def switch_to_group(group)
      touch_w "* id:'tabs' descendant * {text LIKE '#{group}'}"
      fail unless query("* id:'tabs' descendant * {text LIKE '#{group}'}", :selected).first
    end
  end
end