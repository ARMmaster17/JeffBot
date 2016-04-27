require 'awesome_print'

class JeffServer
  def initialize(ch)
    @ch = ch
  end

  def start(queue_name='jeff_bot')
    subscribe(queue_name, Botsolver, respond: true, blocking: true)
  end

  def learn(queue_name='jeff_bot_learn')
    subscribe(queue_name, Learner)
  end

  def respond(queue_name='jeff_bot_respond')
    subscribe(queue_name, Responder, respond: true)
  end

  private
  def subscribe(queue_name, message_parser, blocking: false, respond: false)
    ap "STARTING QUEUE #{queue_name}"
    queue = @ch.queue(queue_name)
    exchange = @ch.default_exchange

    queue.subscribe(:block => blocking) do |delivery_info, properties, payload|
      begin
        r = ""
        begin
          r = message_parser.go(payload)
        rescue StandardError => ex
          r = "ERROR: #{ex}"
        end

        if respond
          exchange.publish(r, :routing_key => properties.reply_to, :correlation_id => properties.correlation_id)
        end
      rescue StandardError => ex
        ap ex
      end
    end
  end
end
