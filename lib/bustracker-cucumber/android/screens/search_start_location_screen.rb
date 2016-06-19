module BusTracker::Android::Screens
  class SearchStartLocationScreen < BusTracker::Screens::BaseScreen
    def initialize(world, opts = {})
      super(world)
      @edit_place = "* id:'edit_place'"
      @list_view = "* id:'list_view'"
      @layout_reset = "* id:'layout_reset'"
      @search_button = "* id:'button_go'"
    end

    def await(wait_opts = {})
      super wait_opts
      self
    end

    def trait
      "* id:'action_bar' descendant * {text LIKE 'Search start location'}"
    end

    def traits
      [@edit_place]
    end

    def enter_from(from)
      touch_w @edit_place
      keyboard_enter_text from
      touch_w @search_button
    end

    def select_from(from)
      from = @list_view + " descendant * {text CONTAINS '#{from}'}"
      touch_w from
    end
  end
end