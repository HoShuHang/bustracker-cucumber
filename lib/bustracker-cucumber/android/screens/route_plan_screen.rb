# encoding: utf-8
module BusTracker::Android::Screens
  class RoutePlanScreen < BusTracker::Screens::BaseScreen
    def initialize(world, opts = {})
      super(world)
      @from = "* id:'text_header' descendant * {text LIKE 'From:'}"
      @to = "* id:'text_header' descendant * {text LIKE 'To:'}"
      @search_button = "* id:'image_submit'"
      @button_options = "* id:'button_options'"
      @checkbox_bus = "* id:'checkbox_bus'"
      @checkbox_metro = "* id:'checkbox_metro'"
      @checkbox_train = "* id:'checkbox_train'"
      @radio_best = "* id:'radio_best'"
      @radio_fewer_transfer = "* id:'radio_fewer_transfer'"
      @radio_less_walking = "* id:'radio_less_walking'"
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

    def plan_transport(transports)
      touch_w @button_options
      wait_for_elements_exist [@checkbox_bus, @checkbox_metro, @checkbox_train]
      uncheck(@checkbox_bus) unless transports.include?('公車')
      uncheck(@checkbox_metro) unless transports.include?('捷運')
      uncheck(@checkbox_train) unless transports.include?('火車')
      check(@checkbox_bus) if transports.include?('公車')
      check(@checkbox_metro) if transports.include?('捷運')
      check(@checkbox_train) if transports.include?('火車')
      touch_w "* id:'button1'"
      await
    end

    def plan_routes(routes)
      touch_w @button_options
      wait_for_elements_exist [@radio_best, @radio_less_walking, @radio_fewer_transfer]
      uncheck(@radio_best) unless routes.include?('最佳路線')
      uncheck(@radio_fewer_transfer) unless routes.include?('轉乘次數較少')
      uncheck(@radio_less_walking) unless routes.include?('步行時間較短')
      check(@radio_best) if routes.include?('最佳路線')
      check(@radio_fewer_transfer) if routes.include?('轉乘次數較少')
      check(@radio_less_walking) if routes.include?('步行時間較短')
      touch_w "* id:'button1'"
      await
    end

    private

    def check(checkbox)
      touch_w checkbox unless query(checkbox, :checked).first
    end

    def uncheck(checkbox)
      touch_w checkbox if query(checkbox, :checked).first
    end

    def should_see_result
      wait_for_elements_exist ["* id:'text_title'"]
    end

    def should_see_error
      err_msg = "* id:'message' descendant * {text LIKE 'No route could be found between the origin and destination.'}"
      wait_for_elements_exist [err_msg]
    end
  end
end