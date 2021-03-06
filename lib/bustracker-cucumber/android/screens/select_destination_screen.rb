module BusTracker::Android::Screens
  class SelectDestinationScreen < BusTracker::Screens::BaseScreen
    def initialize(world, opts = {})
      super(world)
      @edit_stop = "* id:'edit_stop'"
      @list_view = "* id:'list_view'"
      @layout_reset = "* id:'layout_reset'"
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

    def delete_destination_history
      fail "list is empty, no item can delete" if list_view_count <= 0
      history_count = list_view_count
      delete = @list_view + " descendant * id:'image_button'"
      touch_w delete
      fail "not delete" if list_view_count != history_count - 1
    end

    def no_destination
      touch_w @layout_reset
    end

    private

    def list_view_count
      wait_for_elements_exist [@list_view]
      query(@list_view, :count).first
    end
  end
end