# require 'require_relative'

def gem_name
  File.basename __FILE__, '.rb'
end

def cur_dir
  File.dirname(__FILE__)
end

def load_lib_path_to_ruby
  # load lib path to ruby path
  $LOAD_PATH.unshift cur_dir unless
    $LOAD_PATH.include?(cur_dir) ||
    $LOAD_PATH.include?(File.expand_path(cur_dir))
end

def require_files_in_lib(path, &block)
  path_to = File.join(cur_dir, gem_name, path)
  dirs = Dir[path_to].sort_by { |x| x.split('/').count }
  dirs.each do |file|
    file_path = file.split(cur_dir + '/').last
    # req_file = File.join(cur_dir, gem_name, file_path)
    require file_path
    yield file if block_given?
  end
end

def require_main_files
  require 'bustracker-cucumber'
  require_files_in_lib('*.rb')
end

# def require_main_actions
#   require_files_in_lib('**/*.rb') do |file|
#     filename = File.basename(file, '.rb')
#     module_name = filename.gsub(/^[a-z0-9]|_[a-z0-9]/){ |a| a.upcase }.gsub(/_/,'')
#     module_object = Object.const_get("BusTracker::Android::Actions::#{module_name}")
#     World(module_object)
#   end
# end

def require_main_screens
  require_files_in_lib('screens/**/*.rb')
end

def require_android_main_files
  require_files_in_lib("android/*.rb")
end

def require_android_screens
  require_files_in_lib("android/screens/**/*.rb")
end

def require_android_actions
  require_files_in_lib("android/actions/**/*.rb") do |file|
    filename = File.basename(file, '.rb')
    module_name = filename.gsub(/^[a-z0-9]|_[a-z0-9]/){ |a| a.upcase }.gsub(/_/,'')
    module_object = Object.const_get("BusTracker::Android::Actions::#{module_name}")
    World(module_object)
  end
end

load_lib_path_to_ruby

lib_name = File.basename __FILE__, '.rb'
cur_dir = File.dirname(__FILE__)

module BusTracker
  module Actions; end
  module Screens; module View; end; end
end

platform_path = File.join(lib_name, 'android')
require 'calabash-android/cucumber'
require 'calabash-android/abase'

module BusTracker
  module Android
    module Screens
      module View; end
    end
    module Actions; end
  end

  # require 'beango-cucumber/screens/operations'
  # require 'beango-cucumber/android/screens/operations'

  class BaseScreenKlass < Calabash::ABase
  end
end

require_main_files
require_main_screens
require_android_main_files
require_android_actions
require_android_screens

if ENV['FDEBUG'] == '1'
  require 'logger'
  trace_logger = Logger.new(STDOUT)

  set_trace_func proc { |event, file, line, id, _binding, classname|
    if %w(Class Module).include?(classname.class.to_s) &&
       classname.to_s.include?('BusTracker') &&
       %w(call c-call).include?(event)

      filename = file.split(cur_dir + '/').last
      filename_line = "#{filename}:#{line}"
      msg = sprintf("%8s %-60s %s\#%s", event, filename_line, classname, id)
      trace_logger.debug(msg)
    end
  }
end