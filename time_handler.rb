class TimeHandler
  def call(env)
    @request = Rack::Request.new(env)
    @format_time = FormatTime.new(@request.params)

    [status, headers, body]
  end

  private

  def status
    return 400 unless @format_time.params_valid?
    200
  end

  def headers
    { 'Content-Type' => 'text/plain' }
  end

  def body
    @format_time.time
  end
end
