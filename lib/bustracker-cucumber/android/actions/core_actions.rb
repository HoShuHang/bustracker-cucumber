# encoding: utf-8
module BusTracker::Android::Actions::CoreActions
  attr_reader :window
  attr_reader :current_screens

  def action(name, *args)
    method_name = name
    method_name.gsub! ' ', '_'
    send method_name, *args
  end

  def current_screens
    @current_screens ||= {}
  end

  def back_to_main_screen
    until element_exists("* id:'action_bar_container' descendant * {text LIKE 'BusTracker Taipei'}") do
      unless element_exists("* id:'action_bar_container' descendant * {text LIKE 'BusTracker Taipei'}")
        touch_w "* id:'action_bar_container' descendant * contentDescription:'Navigate up'"
      end
    end
  end

  def touch_w(element)
    wait_for_element_exists element
    touch element
  end
end
