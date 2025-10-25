module Jekyll
    module AssetFilter
        def to_time(date_string)
            DateTime.parse(date_string).to_time
        end
        def epoch_to_time(epoch)
            Time.at(epoch)
        end
        def start_of_week_as_epoch(toss)
            Date.parse("Sunday").to_time.to_i
        end
        def start_of_next_month(toss)
            today = Date.today
            if today.month == 12
                Time.new(today.year + 1, 1, 1)
            else
                Time.new(today.year, today.month + 1, 1)
            end
        end
    end
end

Liquid::Template.register_filter(Jekyll::AssetFilter)
