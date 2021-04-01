module Ruby
  module Intl
    class DateTimeFormat
      def initialize(locale, **options)
        @locale = locale
        @options = options
      end

      def format(datetime)
        format_to_parts(datetime).map { |part| part['value'] }.join('')
      end

      def format_to_parts(datetime)
        Javascript::Intl::DateTimeFormat.new(@locale, @options).format_to_parts(datetime)
      end

      def format_range(start_date, end_date)
        format_range_to_parts(start_date, end_date).map { |part| part['value'] }.join('')
      end

      def format_range_to_parts(start_date, end_date)
        Javascript::Intl::DateTimeFormat.new(@locale, @options).format_range_to_parts(start_date, end_date)
      end

      def resolved_options
        Javascript::Intl::DateTimeFormat.new(@locale, @options).resolved_options
      end
    end
  end
end
