def register(params)
        @_param1 = params["param1"]
end

def filter(event)
        ratogtxt = event.get('ratogtxt')

        ratogtxt = ratogtxt&.gsub(/\s[가-힣]+\s고객님/) { |match| ("*" * match.length) + "고객님"  }
        ratogtxt = ratogtxt&.gsub(/\s[가-힣]+\s님/) { |match| ("*" * match.length) + "님"  }

        ratogtxt = ratogtxt.gsub(/\s[공|영|일|이|삼|사|오|육|칠|팔|구|십|열|\s]{4, 13}/) { |match| "*" * match.length }

        replacements = [
            ["...도로명...", "*"],
            ["가가로", "*"],
            ["충남", "*"],
            ["충청북도", "*"],
            ["충북", "*"]
        ]

        replacements.each { |replacement| ratogtxt&.gsub!(replacement[0], replacement[1]) }

        event.set('ratogtxt', ratogtxt)
        return [event]

end

test "test stt " do
    parameters do
        { "param1" => "test" }
    end

    in_event { { "message" => "안녕하세요 홍길동 고객님" } }

    expect("drops the event") do |events|
            events.size >= 0
    end

end
