require_relative 'format_time'
require_relative 'time_handler'
require 'rack'

class App
  def call(env)
    Rack::URLMap.new(
      '/time' => TimeHandler.new,
      '/' => method(:not_found)
    ).call(env)
  end

  private

  def not_found(_env)
    [
      404,
      { 'Content-Type' => 'text/plain' },
      ['404 Not Found']
    ]
  end
end
