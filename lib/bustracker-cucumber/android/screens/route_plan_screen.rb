module BusTracker::Android::Screens
  class RoutePlanScreen < BusTracker::Screens::BaseScreen
    def initialize(world, opts = {})
      super(world)
      @from = "* id:'text_header' descendant * {text LIKE 'From:'}"
      @to = "* id:'text_header' descendant * {text LIKE 'To:'}"
      @search_button = "* id:'image_submit'"
    end

    def await(wait_opts = {})
      super wait_opts
      self
    end

    def trait
      "* id:'action_bar' descendant * {text LIKE 'Directions'}"
    end

    def traits
      [@from, @to]
    end

    def enter_from
      touch_w @from
    end

    def enter_to
      touch_w @to
    end

    def plan_route
      touch_w @search_button
      should_see_result
    end

    def plan_route_error
      touch_w @search_button
      should_see_error
    end

    def set_plan_time(hr, min)
      touch_w "* id:'button_time'"
      set_time("android.widget.TimePicker", hr.to_i, min.to_i)
      touch_w "* id:'buttonPanel'"
    end

    def switch_from_to
      from = query("* id:'text_place'", :text)[0]
      to = query("* id:'text_place'", :text)[1]
      touch_w "* id:'image_switch'"
      new_from = query("* id:'text_place'", :text)[0]
      new_to = query("* id:'text_place'", :text)[1]
      fail 'not switch' unless new_from == to && new_to == from
    end

    private

    def should_see_result
      wait_for_elements_exist ["* id:'text_title'"]
    end

    def should_see_error
      err_msg = "* id:'message' descendant * {text LIKE 'No route could be found between the origin and destination.'}"
      wait_for_elements_exist [err_msg]
    end
  end
end