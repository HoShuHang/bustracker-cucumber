module BusTracker::Android::Screens
  class SearchLocationScreen < BusTracker::Screens::BaseScreen
    def initialize(world, opts = {})
      super(world)
      @edit_place = "* id:'edit_place'"
      @search_button = "* id:'button_go'"
      self
    end

    def await(wait_opts = {})
      super wait_opts
    end

    def trait
      "* id:'action_bar_container' descendant * {text LIKE 'Search location'}"
    end

    def traits
      [@search_button]
    end

    def search(location)
      touch_w @edit_place
      keyboard_enter_text location
      touch_w @search_button
    end

    def select(location)
      touch_w "* {text CONTAINS '#{location}'}"
    end
  end
end