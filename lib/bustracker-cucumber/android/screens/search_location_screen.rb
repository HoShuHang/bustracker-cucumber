module BusTracker::Android::Screens
  class SearchLocationScreen < BusTracker::Screens::BaseScreen
    def initialize(world, opts = {})
      super(world)
      @edit_place = "* id:'edit_place'"
      @search_button = "* id:'button_go'"
      @list_view = "* id:'list_view'"
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

    def cancel_search
      touch_w @edit_place
      clear_text @edit_place
      fail "clear text error" unless query(@edit_place, :text).first.empty?
    end

    def delete_search_location_history
      fail "list is empty, no item can delete" if list_view_count <= 0
      history_count = list_view_count
      delete = @list_view + " descendant * id:'image_button'"
      touch_w delete
      fail "not delete" if list_view_count != history_count - 1
    end

    def should_see_location_in_search_location_history(location)
      wait_for_elements_exist [@list_view]
      history = @list_view+"descendant * {text CONTAINS #{location}}"
      wait_for_elements_exist [history]
    end

    private

    def list_view_count
      wait_for_elements_exist [@list_view]
      query(@list_view, :count).first
    end
  end
end