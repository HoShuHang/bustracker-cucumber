module BusTracker::Android::Screens
  class SearchRouteScreen < BusTracker::Screens::BaseScreen
    def initialize(world, opts = {})
      super(world)
      @search = "* id:'menu_search_keyword'"
      @keyboard = "* id:'keyboard_view0'"
      @result = "* id:'list_view' descendant * id:'text_description'"
    end

    def await(wait_opts = {})
      super wait_opts
    end

    def trait
      "* id:'action_bar' descendant * {text LIKE 'Search'}"
    end

    def traits
      [@keyboard, @search]
    end

    def search(bus)
      bus.each_char do |num|
        btn = "* id:'keyboard_view0' descendant * {text LIKE '#{num}'}"
        touch_w btn
      end
      check_search_result 2 if bus == '299'
    end

    def click_search
      touch_w @search
    end

    def check_search_result(count)
      wait_for_elements_exist [@result] if count > 0
      wait_for_elements_do_not_exist [@result] if count == 0
      actual = query(@result).count
      fail "check search result: expect = #{count}, actual = #{actual}" if count != actual
    end

    def enter_search_result(count)
      result = @result + "index:#{count}"
      wait_for_elements_exist [result]
      touch_w result
      query("* id:'list_view' descendant * id:'text_name' index:#{count}", :text).first
    end
  end
end