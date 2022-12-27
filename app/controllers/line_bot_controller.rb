class LineBotController < ApplicationController
  skip_before_action :require_login, only: %i[client callback]
  skip_before_action :verify_authenticity_token

  require 'net/http'
  require 'uri'
  require 'json'

  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_id = ENV["LINE_CHANNEL_ID"]
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
  end

  def callback
    body = request.body.read
    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
      return head :bad_request
    end

    events = client.parse_events_from(body)
    events.each do |event|
      case event
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          uri = URI.parse("https://api.line.me/v2/bot/user/userId/linkToken")
          http = Net::HTTP.new(uri.host, uri.port)
          http.use_ssl = uri.scheme === "https"
          headers = { "Authorization" => "Bearer {channel access token}" }
          req = Net::HTTP::Post.new(uri.path)
          req.initialize_http_header(headers)

          uri = URI.parse("https://api.line.me/v2/bot/message/push")
          http = Net::HTTP.new(uri.host, uri.port)
          http.use_ssl = uri.scheme === "https"
          params = {
            "to": "{user id}",
            "messages": [{
                "type": "template",
                "altText": "Account Link",
                "template": {
                    "type": "buttons",
                    "text": "Account Link",
                    "actions": [{
                        "type": "uri",
                        "label": "Account Link",
                        "uri": "https://db30-2404-7a82-1821-7800-3964-8000-c7c2-d97b.jp.ngrok.io/link?linkToken=xxx"
                    }]
                }
            }]
          }
          headers = { "Authorization" => "Bearer {channel access token}", "Content-Type" => "application/json" }
          req = Net::HTTP::Post.new(uri.path)
          req.set_form_data(params)
          req.initialize_http_header(headers)

          message = {
            "to": "{user id}",
            "type": "template",
            "altText": "アカウント連携",
            "template": {
              "type": "buttons",
              "title": "LINE Account Link",
              "text": "アカウントを連携します。",
              "actions": [{
                "type": "uri",
                "label": "OK",
                "uri": "https://db30-2404-7a82-1821-7800-3964-8000-c7c2-d97b.jp.ngrok.io/login?linkToken=xxx"
              }]
            }
          }
          client.reply_message(event['replyToken'], message)
        end
      end
    end

    # Don't forget to return a successful response
    "OK"
  end
end