module BusTracker::Android::Screens
  class MainScreen < BusTracker::Screens::BaseScreen
    def initialize(world, opts = {})
      super(world)
      @search = "* id:'button_search'"
      @nearby = "* id:'button_nearby'"
      @direction = "* id:'button_directions'"
      @favorite = "* id:'button_favorites'"
    end

    def await(wait_opts = {})
      super wait_opts
      self
    end

    def trait
      "* id:'action_bar_container' descendant * {text LIKE 'BusTracker Taipei'}"
    end

    def traits
      [@search,
       @nearby,
       @direction,
       @favorite]
    end

    def routes
      touch_w @search
    end

    def nearby
      touch_w @nearby
    end

    def directions
      touch_w @direction
    end

    def favorites
      touch_w @favorite
    end

    # def select(text)
    #   qstr = "* {text LIKE '#{text}'}"
    #   wait_poll(:until_exists => qstr, :timeout => 60) do
    #     scroll("listview", :down)
    #   end
    #   wait_for_elements_exist qstr
    #   p "text : #{qstr}"
    #   touch qstr
    #   sleep 2
    # end

    # def search(text, term_type)
    #   qstr = "* id:'search_text_view'"
    #   wait_for_elements_exist qstr
    #   touch qstr
    #   keyboard_enter_text text
    #   wait_for_elements_exist ["* id:'search_text_view' * {text LIKE '#{text}'}",
    #                            "* id:'term_list_view' * {text CONTAINS '#{text}'}"]
    # end
  end
end