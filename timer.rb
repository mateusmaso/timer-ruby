class Timer

  attr_reader :seconds

  def initialize
    @seconds = 0
  end

  def start
    self.stop
    self.resume
  end

  def stop
    self.pause
    @seconds = 0
  end

  def pause
    Thread.kill(@interval) if @interval
    @interval = nil
  end

  def resume
    return if @interval
    @interval = Thread.new do
      loop do
        @seconds += 1
        sleep(1)
      end
    end
  end

end