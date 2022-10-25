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
          when "Tops", "Bottoms", "One Pieces", "Outers", "Hats", "Rings", "Underwears"
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
    if keyword == "Tops"
      top = User.find(current_user.id).top
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
        text = "トップスのサイズが記録されていません"
      end

    elsif keyword == "Bottoms"
      bottom = User.find(current_user.id).bottom
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
        text = "ボトムスのサイズが記録されていません"
      end

    elsif keyword == "One Pieces"
      one_piece = User.find(current_user.id).one_piece
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
        text = "ワンピースのサイズが記録されていません"
      end

    elsif keyword == "Outers"
      outer = User.find(current_user.id).outer
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
        text = "アウターのサイズが記録されていません"
      end

    elsif keyword == "Hats"
      hat = User.find(current_user.id).hat
      if hat.present?
        text = ''
        text <<
        Hat.human_attribute_name(:head_circumference) + "  " + hat.head_circumference.to_s + "cm"
      else
        text = "帽子のサイズが記録されていません"
      end

    elsif keyword == "Rings"
      ring = User.find(current_user.id).ring
      if ring.present?
        text = ''
        text <<
        Ring.human_attribute_name(:finger_circumference) + "  " + ring.finger_circumference.to_s + "cm"
      else
        text = "指輪のサイズが記録されていません"
      end

    elsif keyword == "Underwears"
      underwear = User.find(current_user.id).underwear
      if underwear.present?
        text = ''
        text <<
        Underwear.human_attribute_name(:top_bust) + "  " + underwear.top_bust.to_s + "cm" + "\n" +
        Underwear.human_attribute_name(:under_bust) + "  " + underwear.under_bust.to_s + "cm" + "\n" +
        Underwear.human_attribute_name(:waist) + "  " + underwear.waist.to_s + "cm" + "\n" +
        Underwear.human_attribute_name(:hip) + "  " + underwear.hip.to_s + "cm"
      else
        text = "下着のサイズが記録されていません"
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
      "text": "どのジャンルのサイズを探してる？",
      "quickReply": {
        "items": [
          {
            "type": "action",
            "imageUrl": "https://example.com/assets/stamp_tops.png",
            "action": {
              "type": "message",
              "label": "Tops",
              "text": "Tops"
            }
          },
          {
            "type": "action",
            "imageUrl": "https://example.com/assets/stamp_bottoms.png",
            "action": {
              "type": "message",
              "label": "Bottoms",
              "text": "Bottoms"
            }
          },
          {
            "type": "action",
            "imageUrl": "https://example.com/assets/stamp_one_pieces.png",
            "action": {
              "type": "message",
              "label": "One Pieces",
              "text": "One Pieces"
            }
          },
          {
            "type": "action",
            "imageUrl": "https://example.com/assets/stamp_outers.png",
            "action": {
              "type": "message",
              "label": "Outers",
              "text": "Outers"
            }
          },
          {
            "type": "action",
            "imageUrl": "https://example.com/assets/stamp_hats.png",
            "action": {
              "type": "message",
              "label": "Hats",
              "text": "Hats"
            }
          },
          {
            "type": "action",
            "imageUrl": "https://example.com/assets/stamp_rings.png",
            "action": {
              "type": "message",
              "label": "Rings",
              "text": "Rings"
            }
          },
          {
            "type": "action",
            "imageUrl": "https://example.com/assets/stamp_underwears.png",
            "action": {
              "type": "message",
              "label": "Underwears",
              "text": "Underwears"
            }
          },
        ]
      }
    }
  end
end