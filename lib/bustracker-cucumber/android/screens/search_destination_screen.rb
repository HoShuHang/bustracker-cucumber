module BusTracker::Android::Screens
  class SearchDestinationScreen < BusTracker::Screens::BaseScreen
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
      "* id:'action_bar' descendant * {text LIKE 'Search destination'}"
    end

    def traits
      [@edit_place]
    end

    def enter_to(to)
      touch_w @edit_place
      keyboard_enter_text to
      touch_w @search_button
    end

    def select_to(to)
      to = @list_view + " descendant * {text CONTAINS '#{to}'}"
      touch_w to
    end

    def delete_to_history
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