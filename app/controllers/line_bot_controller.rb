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
      @tops = Top.all.order(created_at: :desc)
      if @tops.present?
        text = ''
        @tops.each do |top|
          text  <<
          top.title + "\n" +
          Top.human_attribute_name(:neck) + "  " + top.neck.to_s + "cm" + "\n" +
          Top.human_attribute_name(:shoulder_width) +  "  " + top.shoulder_width.to_s + "cm" + "\n" +
          Top.human_attribute_name(:body_width) + "  " + top.body_width.to_s+ "cm" + "\n" +
          Top.human_attribute_name(:body_length) + "  " + top.body_length.to_s + "cm" + "\n" +
          Top.human_attribute_name(:sleeve_length) + "  " + top.sleeve_length.to_s + "cm" + "\n" +
          Top.human_attribute_name(:sleeve_width) + "  " + top.sleeve_width.to_s + "cm" + "\n" +
          "\n"
        end
      else
        text = "トップスのサイズが記録されていません"
      end

    elsif keyword == "Bottoms"
      @bottoms = Bottom.all.order(created_at: :desc)
      if @bottoms.present?
        text = ''
        @bottoms.each do |bottom|
          text <<
          bottom.title + "\n" +
          Bottom.human_attribute_name(:waist) + "  " + bottom.waist.to_s + "cm" + "\n" +
          Bottom.human_attribute_name(:hip) + "  " + bottom.hip.to_s + "cm" + "\n" +
          Bottom.human_attribute_name(:rising_length) + "  " + bottom.rising_length.to_s + "cm" + "\n" +
          Bottom.human_attribute_name(:inseam) + "  " + bottom.inseam.to_s + "cm" + "\n" +
          Bottom.human_attribute_name(:total_length) + "  " + bottom.total_length.to_s + "cm" + "\n" +
          Bottom.human_attribute_name(:thickness_of_thigh) + "  " + bottom.thickness_of_thigh.to_s + "cm" + "\n" +
          Bottom.human_attribute_name(:bottom_width) + "  " + bottom.bottom_width.to_s + "cm"
          "\n"
        end
      else
        text = "ボトムスのサイズが記録されていません"
      end

    elsif keyword == "One Pieces"
      @one_pieces = OnePiece.all.order(created_at: :desc)
      if @one_pieces.present?
        text = ''
        @one_pieces.each do |one_piece|
          text <<
          one_piece.title + "\n" +
          OnePiece.human_attribute_name(:neck) + "  " + one_piece.neck.to_s + "cm" + "\n" +
          OnePiece.human_attribute_name(:shoulder_width) + "  " + one_piece.shoulder_width.to_s + "cm" + "\n" +
          OnePiece.human_attribute_name(:bust) + "  " + one_piece.bust.to_s + "cm" + "\n" +
          OnePiece.human_attribute_name(:waist) + "  " + one_piece.waist.to_s + "cm" + "\n" +
          OnePiece.human_attribute_name(:hip) + "  " + one_piece.hip.to_s + "cm" + "\n" +
          OnePiece.human_attribute_name(:body_length) + "  " + one_piece.body_length.to_s + "cm" + "\n" +
          OnePiece.human_attribute_name(:sleeve_length) + "  " + one_piece.sleeve_length.to_s + "cm" + "\n" +
          OnePiece.human_attribute_name(:sleeve_width) + "  " + one_piece.sleeve_width.to_s + "cm"
          "\n"
        end
      else
        text = "ワンピースのサイズが記録されていません"
      end

    elsif keyword == "Outers"
      @outers = Outer.all.order(created_at: :desc)
      if @outers.present?
        text = ''
        @outers.each do |outer|
          text <<
          outers.title + "\n" +
          Outers.human_attribute_name(:neck) + "  " + outer.neck.to_s + "cm" + "\n" +
          Outers.human_attribute_name(:shoulder_width) + "  " + outer.shoulder_width.to_s + "cm" + "\n" +
          Outers.human_attribute_name(:body_width) + "  " + outer.body_width.to_s + "cm" + "\n" +
          Outers.human_attribute_name(:body_length) + "  " + outer.body_length.to_s + "cm" + "\n" +
          Outers.human_attribute_name(:sleeve_length) + "  " + outer.sleeve_length.to_s + "cm" + "\n" +
          Outers.human_attribute_name(:sleeve_width) + "  " + outer.sleeve_width.to_s + "cm"
          "\n"
        end
      else
        text = "アウターのサイズが記録されていません"
      end

    elsif keyword == "Hats"
      @hats = Hat.all.order(created_at: :desc)
      if @hats.present?
        text = ''
        @hats.each do |hat|
          text <<
          hat.title + "\n" +
          Hat.human_attribute_name(:head_circumference) + "  " + hat.head_circumference.to_s + "cm"
          "\n"
        end
      else
        text = "帽子のサイズが記録されていません"
      end

    elsif keyword == "Rings"
      @rings = Ring.all.order(created_at: :desc)
      if @rings.present?
        text = ''
        @rings.each do |hat|
          text <<
          ring.title + "\n" +
          Ring.human_attribute_name(:finger_circumference) + "  " + ring.finger_circumference.to_s + "cm"
          "\n"
        end
      else
        text = "指輪のサイズが記録されていません"
      end

    elsif keyword == "Underwears"
      @underwears = Underwear.all.order(created_at: :desc)
      if @underwears.present?
        text = ''
        @underwears.each do |underwear|
          text <<
          underwear.title + "\n" +
          Underwear.human_attribute_name(:top_bust) + "  " + underwear.top_bust.to_s + "cm" + "\n" +
          Underwear.human_attribute_name(:under_bust) + "  " + underwear.under_bust.to_s + "cm" + "\n" +
          Underwear.human_attribute_name(:waist) + "  " + underwear.waist.to_s + "cm" + "\n" +
          Underwear.human_attribute_name(:hip) + "  " + underwear.hip.to_s + "cm"
          "\n"
        end
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