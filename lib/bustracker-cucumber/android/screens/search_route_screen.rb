module BusTracker::Android::Screens
  class SearchRouteScreen < BusTracker::Screens::BaseScreen
    def initialize(world, opts = {})
      super(world)
      @search = "* id:'menu_search_keyword'"
      @keyboard = "* id:'keyboard_view0'"
      @result = "* id:'list_view' descendant * id:'text_description'"
      @search_close = "* id:'search_close_btn'"
      @reset = "* id:'keyboard_view0' descendant * {text LIKE 'Reset'}"
      @search_bar_text = "* id:'search_src_text'"
      @delete = "* id:'keyboard_view0' descendant * {text LIKE 'DEL'}"
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

    def search(bus, bus_type, opts={})
      if bus_type == '輸入'
        click_search
        keyboard_enter_text bus
        wait_for_elements_exist [@search_bar_text]
        fail 'input error' unless query(@search_bar_text, :text).first.include?(bus)
        press_enter_button unless opts[:edit]
      else
        bus.each_char do |num|
          btn = "* id:'keyboard_view0' descendant * {text LIKE '#{num}'}"
          touch_w btn
        end
      end
      wait_for_elements_exist ["* id:'action_bar' descendant * {text CONTAINS '#{bus}'}"]
      check_search_result 2 if bus == '299'
    end

    def check_search_empty
      wait_for_elements_do_not_exist ["* id:'list_view'"]
    end

    def click_search
      touch_w @search
    end

    def check_search_route_result(bus)
      wait_for_elements_exist ["* id:'action_bar' descendant * {text CONTAINS '#{bus}'}"]
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

    def cancel_input
      touch_w @search_close
      fail 'input text not delete' unless query(@search_bar_text, :text).first.empty?
    end

    def reset_search_route
      touch_w @reset
      check_search_result 0
    end

    def delete_input_text
      wait_for_elements_exist ["* id:'action_bar' descendant *"]
      fail 'search bar is empty' if query("* id:'action_bar' descendant *", :text).last.empty?
      touch_w @delete
      count = query("* id:'action_bar' descendant *", :text).count
      a_bar_text = query("* id:'action_bar' descendant *", :text)[count-2]
      a_bar_text_after_delete = query("* id:'action_bar' descendant *", :text)[count-1]
      fail 'delete input text error' unless a_bar_text == a_bar_text_after_delete
    end
  end
end