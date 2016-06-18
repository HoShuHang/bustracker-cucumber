module BusTracker::Android::Screens
  class SelectDestinationScreen < BusTracker::Screens::BaseScreen
    def initialize(world, opts = {})
      super(world)
      @edit_stop = "* id:'edit_stop'"
      @list_view = "* id:'list_view'"
    end

    def await(wait_opts = {})
      super wait_opts
      self
    end

    def trait
      "* id:'action_bar' descendant * {text LIKE 'Choose destination'}"
    end

    def traits
      [@edit_stop]
    end

    def search_destination(stop)
      touch_w @edit_stop
      keyboard_enter_text stop
      press_enter_button
      wait_for_elements_exist [@list_view]
      fail "no search result" unless query(@list_view, :count).first > 0
    end

    def select_destination(stop)
      stop = "* id:'list_view' descendant * {text CONTAINS '#{stop}'}"
      wait_for_elements_exist [stop]
      touch_w stop
    end

    def cancel_search_destination
      touch_w @edit_stop
      clear_text touch_w @edit_stop
      fail "clear text error" unless query(@edit_stop, :text).first.empty?
    end

    def should_see_destination_in_select_destination_history(destination)
      history = @list_view+"descendant * {text CONTAINS #{destination}}"
      wait_for_elements_exist [history]
    end
  end
end