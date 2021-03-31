require 'ruby/intl/version'

require 'date'
require 'execjs'

module Javascript
  module Intl

    @@cache = false

    def self.cache=(value)
      @@cache = value
    end

    def self.cache
      @@cache
    end

    def self.storage
      @storage ||= {}
    end

    def self.cached(*args)
      return storage[args.to_json] ||= yield if cache
      yield
    end

    # def self.cached(*args)
    #   return JSON.parse(storage[args.to_json] ||= yield.to_json) if cache
    #   yield
    # end


    class Error < StandardError; end
    class DateTimeFormat
      CTX = ExecJS.compile(<<-JS)
        const makeDate = function(dateArray) {
          return new Date(Date.UTC(dateArray[0],dateArray[1],dateArray[2],dateArray[3],dateArray[4],dateArray[5],dateArray[6]));
        }

        const DateTimeFormat_format = function(locales, options, date) {
          return Intl.DateTimeFormat(locales, options).format(makeDate(date))
        };

        const DateTimeFormat_formatRange = function(locales, options, startDate, endDate) {
          return Intl.DateTimeFormat(locales, options).formatRange(makeDate(startDate), makeDate(endDate))
        };

        const DateTimeFormat_formatRangeToParts = function(locales, options, startDate, endDate) {
          return Intl.DateTimeFormat(locales, options).formatRangeToParts(makeDate(startDate), makeDate(endDate))
        };

        const DateTimeFormat_formatToParts = function(locales, options, date) {
          return Intl.DateTimeFormat(locales, options).formatToParts(makeDate(date))
        };

        const DateTimeFormat_resolvedOptions = function(locales, options) {
          return Intl.DateTimeFormat(locales, options).resolvedOptions()
        };
      JS

      def initialize(locale, **options)
        @locale = locale
        @options = options
      end

      def date_time_to_a(datetime)
        [
          datetime.year,
          datetime.month,
          datetime.day,
          datetime.hour,
          datetime.minute,
          datetime.second,
          datetime.second,
          (datetime.sec_fraction * 1000).to_i
        ]
      end

      def format(datetime)
        Javascript::Intl.cached(self.class, @locale, @options, :format, datetime) { CTX.call('DateTimeFormat_format', @locale, @options, date_time_to_a(datetime), bare: true) }
      end

      def format_to_parts(datetime)
        Javascript::Intl.cached(self.class, @locale, @options, :format_to_parts, datetime) { CTX.call('DateTimeFormat_formatToParts', @locale, @options, date_time_to_a(datetime), bare: true) }
      end

      def format_range(start_date, end_date)
        Javascript::Intl.cached(self.class, @locale, @options, :format_range, start_date, end_date) { CTX.call('DateTimeFormat_formatRange', @locale, @options, date_time_to_a(start_date), date_time_to_a(end_date), bare: true) }
      end

      def format_range_to_parts(start_date, end_date)
        Javascript::Intl.cached(self.class, @locale, @options, :format_range_to_parts, start_date, end_date) { CTX.call('DateTimeFormat_formatRangeToParts', @locale, @options, date_time_to_a(start_date), date_time_to_a(end_date), bare: true) }
      end

      def resolved_options
        Javascript::Intl.cached(self.class, @locale, @options, :resolved_options, ) { CTX.call('DateTimeFormat_resolvedOptions', @locale, @options, bare: true) }
      end
    end

    class RelativeTimeFormat
      CTX = ExecJS.compile(<<-JS)
        const RelativeTimeFormat_format = function(locales, options, value, units) {
          return (new Intl.RelativeTimeFormat(locales, options)).format(value, units)
        };


        const RelativeTimeFormat_formatToParts = function(locales, options, value, units) {
          return (new Intl.RelativeTimeFormat(locales, options)).formatToParts(value, units)
        };


        const RelativeTimeFormat_resolvedOptions = function(locales, options) {
          return (new Intl.RelativeTimeFormat(locales, options)).resolvedOptions()
        };
      JS

      def initialize(locale, **options)
        @locale = locale
        @options = options
      end

      def format(value, unit)
        Javascript::Intl.cached(self.class, @locale, @options, :format, value, unit) { CTX.call('RelativeTimeFormat_format', @locale, @options, value, unit, bare: true) }
      end

      def format_to_parts(value, unit)
        Javascript::Intl.cached(self.class, @locale, @options, :format_to_parts, value, unit) { CTX.call('RelativeTimeFormat_formatToParts', @locale, @options, value, unit, bare: true) }
      end

      def resolved_options
        Javascript::Intl.cached(self.class, @locale, @options, :resolved_options, ) { CTX.call('RelativeTimeFormat_resolvedOptions', @locale, @options, bare: true) }
      end
    end
  end
end
