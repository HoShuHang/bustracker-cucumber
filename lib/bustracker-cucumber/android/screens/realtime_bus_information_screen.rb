module BusTracker::Android::Screens
  class RealtimeBusInformationScreen < BusTracker::Screens::BaseScreen
    def initialize(world, opts = {})
      super(world)
      @tabs = "* id:'tabs'"
      @outbound = "* id:'tabs' descendant * {text LIKE '#{query_tab[0]}'}"
      @inbound = "* id:'tabs' descendant * {text LIKE '#{query_tab[1]}'}"
      @menu_route_map = "* id:'action_bar' descendant * id:'menu_route_map'"
      @menu_route_info = "* id:'action_bar' descendant * id:'menu_route_info'"
      @menu_route_nearby = "* id:'action_bar' descendant * id:'menu_route_nearby'"
    end

    def await(wait_opts = {})
      @bus = wait_opts[:bus]
      super wait_opts
    end

    def trait
      "* id:'action_bar_container' descendant * {text CONTAINS '#{@bus}'}"
    end

    def traits
      [@tabs, @outbound, @inbound, @menu_route_map, @menu_route_info, @menu_route_nearby]
    end

    def add_to_group(stop, group)
      select_stop stop
      touch_w "* id:'text_view' descendant * {text LIKE 'Add'}"
      touch_w "* id:'text_view' descendant {text LIKE '預設群組'}" unless group
      if group
        touch_w "* id:'edit_group'"
        keyboard_enter_text group
        touch_w "* id:'button1' descendant * {text LIKE 'Submit'}"
      end
      wait_for_elements_exist ["* id:'message' descendant * {text LIKE 'Favorite added.'}"]
    end

    def select_stop(stop)
      touch_w "* {text CONTAINS '#{stop}'}"
    end

    def should_see_outbound_bus_status
      selected = query(@outbound, :selected).first
      touch_w @outbound unless selected
      fail "outbound bus status error" unless query(@outbound, :selected).first
    end

    def should_see_inbound_bus_status
      selected = query(@inbound, :selected).first
      touch_w @inbound unless selected
      fail "inbound bus status error" unless query(@inbound, :selected).first
    end

    private

    def query_tab
      descendant_tab = "* id:'tabs' descendant *"
      wait_for_elements_exist [descendant_tab]
      texts = query(descendant_tab, :text)
      return_texts = []
      texts.each do |t|
        return_texts << t if t.is_a? String
      end
      return_texts
    end
  end
end