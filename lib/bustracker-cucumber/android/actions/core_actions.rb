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

  def touch_w(element)
    wait_for_elements_exist element
    touch element
  end
end
