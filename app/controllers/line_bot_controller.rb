class LineBotController < ApplicationController
  protect_from_forgery except: %i[callback]

  def callback
    body = request.body.read
    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
      return head :bad_request
    end
    events = client.parse_events_from(body)
    events.each do |event|
      @message = event.message['text'].gsub(" ", "") 
      case event
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          case @message
          when Top.model_name.human, Bottom.model_name.human, OnePiece.model_name.human, Outer.model_name.human, Hat.model_name.human, Ring.model_name.human, Underwear.model_name.human
            message = search_and_create_message(@message)
            client.reply_message(event['replyToken'], message)
          else
            message = first_reply
            client.reply_message(event['replyToken'], message)
          end
        end
      end
    end
    head :ok
  end

  private

  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
  end

  def search_and_create_message(keyword)
    if keyword == Top.model_name.human
      top = User.find_by(current_user).top
      if top.present?
        text = ''
        text  <<
        Top.human_attribute_name(:neck) + "  " + top.neck.to_s + "cm" + "\n" +
        Top.human_attribute_name(:shoulder_width) +  "  " + top.shoulder_width.to_s + "cm" + "\n" +
        Top.human_attribute_name(:body_width) + "  " + top.body_width.to_s+ "cm" + "\n" +
        Top.human_attribute_name(:body_length) + "  " + top.body_length.to_s + "cm" + "\n" +
        Top.human_attribute_name(:sleeve_length) + "  " + top.sleeve_length.to_s + "cm" + "\n" +
        Top.human_attribute_name(:sleeve_width) + "  " + top.sleeve_width.to_s + "cm"
      else
        text = t('.not_jenre_size', jenre: Top.model_name.human)
      end

    elsif keyword == Bottom.model_name.human
      bottom = User.find_by(current_user).bottom
      if bottom.present?
        text = ''
        text <<
        Bottom.human_attribute_name(:waist) + "  " + bottom.waist.to_s + "cm" + "\n" +
        Bottom.human_attribute_name(:hip) + "  " + bottom.hip.to_s + "cm" + "\n" +
        Bottom.human_attribute_name(:rising_length) + "  " + bottom.rising_length.to_s + "cm" + "\n" +
        Bottom.human_attribute_name(:inseam) + "  " + bottom.inseam.to_s + "cm" + "\n" +
        Bottom.human_attribute_name(:total_length) + "  " + bottom.total_length.to_s + "cm" + "\n" +
        Bottom.human_attribute_name(:thickness_of_thigh) + "  " + bottom.thickness_of_thigh.to_s + "cm" + "\n" +
        Bottom.human_attribute_name(:bottom_width) + "  " + bottom.bottom_width.to_s + "cm"
      else
        text = t('.not_jenre_size', jenre: Bottom.model_name.human)
      end

    elsif keyword == OnePiece.model_name.human
      one_piece = User.find_by(current_user).one_piece
      if one_piece.present?
        text = ''
        text <<
        OnePiece.human_attribute_name(:neck) + "  " + one_piece.neck.to_s + "cm" + "\n" +
        OnePiece.human_attribute_name(:shoulder_width) + "  " + one_piece.shoulder_width.to_s + "cm" + "\n" +
        OnePiece.human_attribute_name(:bust) + "  " + one_piece.bust.to_s + "cm" + "\n" +
        OnePiece.human_attribute_name(:waist) + "  " + one_piece.waist.to_s + "cm" + "\n" +
        OnePiece.human_attribute_name(:hip) + "  " + one_piece.hip.to_s + "cm" + "\n" +
        OnePiece.human_attribute_name(:body_length) + "  " + one_piece.body_length.to_s + "cm" + "\n" +
        OnePiece.human_attribute_name(:sleeve_length) + "  " + one_piece.sleeve_length.to_s + "cm" + "\n" +
        OnePiece.human_attribute_name(:sleeve_width) + "  " + one_piece.sleeve_width.to_s + "cm"
      else
        text = t('.not_jenre_size', jenre: OnePiece.model_name.human)
      end

    elsif keyword == Outer.model_name.human
      outer = User.find_by(current_user).outer
      if outer.present?
        text = ''
        text <<
        Outers.human_attribute_name(:neck) + "  " + outer.neck.to_s + "cm" + "\n" +
        Outers.human_attribute_name(:shoulder_width) + "  " + outer.shoulder_width.to_s + "cm" + "\n" +
        Outers.human_attribute_name(:body_width) + "  " + outer.body_width.to_s + "cm" + "\n" +
        Outers.human_attribute_name(:body_length) + "  " + outer.body_length.to_s + "cm" + "\n" +
        Outers.human_attribute_name(:sleeve_length) + "  " + outer.sleeve_length.to_s + "cm" + "\n" +
        Outers.human_attribute_name(:sleeve_width) + "  " + outer.sleeve_width.to_s + "cm"
      else
        text = t('.not_jenre_size', jenre: Outer.model_name.human)
      end

    elsif keyword == Hat.model_name.human
      hat = User.find_by(current_user).hat
      if hat.present?
        text = ''
        text <<
        Hat.human_attribute_name(:head_circumference) + "  " + hat.head_circumference.to_s + "cm"
      else
        text = t('.not_jenre_size', jenre: Hat.model_name.human)
      end

    elsif keyword == Ring.model_name.human
      ring = User.find_by(current_user).ring
      if ring.present?
        text = ''
        text <<
        Ring.human_attribute_name(:finger_circumference) + "  " + ring.finger_circumference.to_s + "cm"
      else
        text = t('.not_jenre_size', jenre: Ring.model_name.human)
      end

    elsif keyword == Underwear.model_name.human
      underwear = User.find_by(current_user).underwear
      if underwear.present?
        text = ''
        text <<
        Underwear.human_attribute_name(:top_bust) + "  " + underwear.top_bust.to_s + "cm" + "\n" +
        Underwear.human_attribute_name(:under_bust) + "  " + underwear.under_bust.to_s + "cm" + "\n" +
        Underwear.human_attribute_name(:waist) + "  " + underwear.waist.to_s + "cm" + "\n" +
        Underwear.human_attribute_name(:hip) + "  " + underwear.hip.to_s + "cm"
      else
        text = t('.not_jenre_size', jenre: Underwear.model_name.human)
      end
    end
    message = {
      type: 'text',
      text: text
    }
  end

  def first_reply
    {
      "type": "text",
      "text": (t'.which_jenre'),
      "quickReply": {
        "items": [
          {
            "type": "action",
            "action": {
              "type": "message",
              "label": Top.model_name.human,
              "text": Top.model_name.human
            }
          },
          {
            "type": "action",
            "action": {
              "type": "message",
              "label": Bottom.model_name.human,
              "text": Bottom.model_name.human
            }
          },
          {
            "type": "action",
            "action": {
              "type": "message",
              "label": OnePiece.model_name.human,
              "text": OnePiece.model_name.human
            }
          },
          {
            "type": "action",
            "action": {
              "type": "message",
              "label": Outer.model_name.human,
              "text": Outer.model_name.human
            }
          },
          {
            "type": "action",
            "action": {
              "type": "message",
              "label": Hat.model_name.human,
              "text": Hat.model_name.human
            }
          },
          {
            "type": "action",
            "action": {
              "type": "message",
              "label": Ring.model_name.human,
              "text": Ring.model_name.human
            }
          },
          {
            "type": "action",
            "action": {
              "type": "message",
              "label": Underwear.model_name.human,
              "text": Underwear.model_name.human
            }
          },
        ]
      }
    }
  end
end