require 'kopflos/xvfb'

module Kopflos
  class AlreadyRunning < Exception; end

  def self.start(opts={})
    if running?
      raise AlreadyRunning, "there is already a server running: #{@server}"
    else
      @server = Xvfb.new(opts)
      @server.start
      @server
    end
  end

  def self.stop
    if running?
      @server.stop
      @server = nil
    end
  end

  def self.running?
    @server && @server.running?
  end

  def self.reset!
    stop
    @server = nil
  end
end
