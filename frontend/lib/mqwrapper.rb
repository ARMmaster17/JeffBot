require_relative 'mq'

module MQWrapper
    def send(msg)
        conn = Bunny.new(ENV['RABBITMQ_BIGWIG_URL'])
        conn.start
        ch   = conn.create_channel
        client   = MQClient.new(ch, "jeff_queue")
        payload = client.call(msg)
        ch.close
        conn.close
        return payload
    end
end