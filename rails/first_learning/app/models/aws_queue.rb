require 'aws-sdk'

class AWSQueue
  def initialize(queue_name: 'sqs-tutorial-fifo-queue.fifo')
    @sqs = Aws::SQS::Client.new
    @queue_url = @sqs.get_queue_url(queue_name: queue_name).queue_url
    @is_fifo = queue_name.include? '.fifo'
  end

  def show_queues
    # from https://docs.aws.amazon.com/ja_jp/sdk-for-ruby/v3/developer-guide/sqs-example-show-queues.html
    queues = @sqs.list_queues

    queues.queue_urls.each do |url|
      puts 'URL:                ' + url

      # Get ARN, messages available, and messages in flight for queue
      req = @sqs.get_queue_attributes(
        {
          queue_url: url, attribute_names:
            [
              'QueueArn',
              'ApproximateNumberOfMessages',
              'ApproximateNumberOfMessagesNotVisible'
            ]
        }
      )

      arn = req.attributes['QueueArn']
      msgs_available = req.attributes['ApproximateNumberOfMessages']
      msgs_in_flight = req.attributes['ApproximateNumberOfMessagesNotVisible']

      puts 'ARN:                ' + arn
      puts 'Messages available: ' + msgs_available
      puts 'Messages in flight: ' + msgs_in_flight
    end
  end

  def create_queue(name:)
    resp = @sqs.create_queue(queue_name: name)

    puts resp.queue_url
  end

  def send_message(text: '')
    puts "queue_url: #{queue_url}, class: #{queue_url.class}"
    message_body = "message_body: #{text}"
    resp = @sqs.send_message(
      queue_url: @queue_url,
      message_body: message_body,
      message_attributes: {
        "String" => {
          string_value: "string_value",
          data_type: "String"
        },
        "Number_type" => {
          string_value: "1234567890",
          data_type: "Number"
        }
      },
      message_group_id: fifo_message_group_id
    )
    puts "resp.md5_of_message_body: #{resp.md5_of_message_body}"
    puts "resp.md5_of_message_attributes: #{resp.md5_of_message_attributes}"
    puts "resp.md5_of_message_system_attributes: #{resp.md5_of_message_system_attributes}"
    puts "resp.message_id: #{resp.message_id}"
    puts "resp.sequence_number: #{resp.sequence_number}"
    puts ""
  end

  def send_message_batch(text: '')
    messages = (1..10).to_a.map do |i|
      create_message(text: text, id: i)
    end
    respes = @sqs.send_message_batch(
      queue_url: @queue_url,
      entries: messages
    )
    respes.successful.each do |resp|
      puts "successful_resp.id: #{resp.id}"
      puts "successful_resp.md5_of_message_body: #{resp.md5_of_message_body}"
      puts "successful_resp.md5_of_message_attributes: #{resp.md5_of_message_attributes}"
      puts "successful_resp.md5_of_message_system_attributes: #{resp.md5_of_message_system_attributes}"
      puts "successful_resp.message_id: #{resp.message_id}"
      puts "successful_resp.sequence_number: #{resp.sequence_number}"
      puts ""
    end
    respes.failed.each do |resp|
      puts "failed_resp.id: #{resp.id}"
      puts "failed_resp.code: #{resp.code}"
      puts "failed_resp.message: #{resp.message}"
      puts "failed_resp.sender_fault: #{resp.sender_fault}"
      puts ""
    end
  end

  def receive_message(up_to: 10, wait_time_seconds: 0)
    resp = @sqs.receive_message(
      queue_url: @queue_url,
      attribute_names: ["All"],
      message_attribute_names: ["All"],
      max_number_of_messages: up_to,
      # visibility_timeout: 1,
      wait_time_seconds: wait_time_seconds,
      # receive_request_attempt_id: "receive_request_attempt_id-1",
    )
    messages = resp.messages
    messages.each.with_index(1) do |msg, i|
      puts "message-#{i}"
      puts "msg.message_id: #{msg.message_id}"
      puts "msg.body: #{msg.body}"
      puts "msg.md5_of_body: #{msg.md5_of_body}"
      puts "msg.message_attributes: #{msg.message_attributes}"
      puts "msg.md5_of_message_attributes: #{msg.md5_of_message_attributes}"
      puts "msg.attributes: #{msg.attributes}"
      puts "msg.receipt_handle: #{msg.receipt_handle}"
      puts ""
    end
  end

  def long_polling(skip_delete: false, idle_timeout: 5, max_number_of_messages: 10)
    poller = Aws::SQS::QueuePoller.new @queue_url
    poller.poll(idle_timeout: idle_timeout, skip_delete: skip_delete, max_number_of_messages: max_number_of_messages) do |msgs|
      msgs.each.with_index(1) do |msg, i|
        puts "message-#{i}"
        puts "msg.message_id: #{msg.message_id}"
        puts "msg.body: #{msg.body}"
        puts "msg.md5_of_body: #{msg.md5_of_body}"
        puts "msg.message_attributes: #{msg.message_attributes}"
        puts "msg.md5_of_message_attributes: #{msg.md5_of_message_attributes}"
        puts "msg.attributes: #{msg.attributes}"
        puts "msg.receipt_handle: #{msg.receipt_handle}"
        puts ""
      end
    end
  end

  def delete_message(count: 1)
    message = resp = @sqs.receive_message(
      queue_url: @queue_url,
      max_number_of_messages: 1
    ).messages.first
    @sqs.delete_message(
      queue_url: @queue_url,
      receipt_handle: message.receipt_handle
    )
  end

  def delete_message_batch
    message_entries = resp = @sqs.receive_message(
      queue_url: @queue_url,
      max_number_of_messages: 10
    ).messages.map.with_index(1) do |msg, i|
      { id: i.to_s, receipt_handle: msg.receipt_handle }
    end
    resps = @sqs.delete_message_batch(
      queue_url: @queue_url,
      entries: message_entries
    )
    resps.successful.each do |resp|
      puts "successful_id: #{resp.id}"
    end

    resps.failed.each do |resp|
      puts "failed_resp.id: #{resp.id}"
      puts "failed_resp.code: #{resp.code}"
      puts "failed_resp.message: #{resp.message}"
      puts "failed_resp.sender_fault: #{resp.sender_fault}"
      puts ""
    end
  end

  private
  def create_message(text:, id:, group_id: 'learning-rails-aws-sqs')
    {
      id: id.to_s,
      message_body: "#{id}: #{text}",
      message_attributes: {
        "String" => {
          string_value: "string_value",
          data_type: "String"
        },
        "Number_type" => {
          string_value: "1234567890",
          data_type: "Number"
        }
      },
      message_group_id: fifo_message_group_id(group_id: group_id)
    }
  end

  def fifo_message_group_id(group_id: 'learning-rails-aws-sqs')
    @is_fifo ? group_id : nil
  end
end
