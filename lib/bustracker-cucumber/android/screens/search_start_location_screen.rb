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

    def delete_from_history
      fail "list is empty, no item can delete" if list_view_count <= 0
      history_count = list_view_count
      delete = @list_view + " descendant * id:'image_button'"
      touch_w delete
      fail "not delete" if list_view_count != history_count - 1
    end

    private

    def list_view_count
      wait_for_elements_exist [@list_view]
      query(@list_view, :count).first
    end
  end
end