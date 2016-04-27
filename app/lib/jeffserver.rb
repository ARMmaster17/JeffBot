class JeffServer

  def initialize(ch)
    @ch = ch
  end

  def start(queue_name)
    @q = @ch.queue(queue_name)
    @x = @ch.default_exchange

    @q.subscribe(:block => true) do |delivery_info, properties, payload|
      puts payload
      r = Botsolver.go(payload)
      @x.publish(r, :routing_key => properties.reply_to, :correlation_id => properties.correlation_id)
    end
  end
end
