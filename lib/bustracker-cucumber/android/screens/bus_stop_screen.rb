module BusTracker::Android::Screens
  class BusStopScreen < BusTracker::Screens::BaseScreen
    def initialize(world, opts = {})
      super(world)
      @menu_passby_destination = "* id:'menu_passby_destination'"
      @menu_passby_addall = "* id:'menu_passby_addall'"
      @menu_passby_sort = "* id:'menu_passby_sort'"
    end

    def await(wait_opts = {})
      super wait_opts
      self
    end

    def trait
      "* id:'action_bar'"
    end

    def traits
      [@menu_passby_destination, @menu_passby_addall, @menu_passby_sort]
    end

    def add_all_to_group
      touch_w @menu_passby_addall
      message = "* id:'message' descendant * {text LIKE 'Add all stops to favorites ?'}"
      no = "* id:'button2' descendant * {text LIKE 'No'}"
      yes = "* id:'button1' descendant * {text LIKE 'Yes'}"
      wait_for_elements_exist [message, no, yes]
      touch_w yes
    end
  end
end