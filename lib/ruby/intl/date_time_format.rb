require 'cldr'
require "yaml"

module Cldr
  module Format
    class MyDateTime < Datetime::Base
      PATTERN = /G{1,5}|y+|Y+|Q{1,4}|q{1,5}|M{1,5}|L{1,5}|d{1,2}|F{1}|E{1,5}|e{1,5}|c{1,5}|a{1}|h{1,2}|H{1,2}|K{1,2}|k{1,2}|m{1,2}|s{1,2}|S+|z{1,4}|Z{1,4}|\'.*?\'/.freeze
      METHODS = { # ignoring u, l, g, j, A
        'G' => :era, # AD, Anno Domini, A | BC, Before Christ, B
        'y' => :year, # 96, 1996
        'Y' => :year_of_week_of_year, # 1997
        'Q' => :quarter, # 2, 02, Q2, 2nd quarter, 2
        'q' => :quarter_stand_alone, # 2, 02, Q2, 2nd quarter, 2
        'M' => :month, # 9, 09, Sep, September, S
        'L' => :month_stand_alone, # 9, 09, Sep, September, S
        'w' => :week_of_year, # 27, 27
        'W' => :week_of_month, # 2
        'd' => :day, # 2, 02
        'D' => :day_of_month, # 189
        'F' => :day_of_week_in_month, # F
        'E' => :weekday, # Tue, Tuesday, T, Tu
        'e' => :weekday_local, # 2, Tue, Tuesday, T, Tu
        'c' => :weekday_local_stand_alone, # 2, Tue, Tuesday, T, Tu
        'a' => :period, # pm | am
        'h' => :hour, # hour in am/pm (1~12):   7, 07
        'H' => :hour, # hour in day (0~23):   0, 00
        'K' => :hour, # hour in day (1~24):  24, 24
        'k' => :hour, # hour in am/pm (0~11):   0, 00
        'm' => :minute, # 4, 04
        's' => :second, # 5, 05
        'S' => :second_fraction, # 2, 23, 235, 2350
        'z' => :timezone, # PDT, Pacific Daylight Time
        'Z' => :timezone, # -0800, GMT-08:00, -08:00, -07:52:58, Z
        'v' => :timezone_generic_non_location, # PT, Pacific Time or Los Angeles Time
        'V' => :timezone_metazone, # uslax, America/Los_Angeles, Los Angeles, Los Angeles Time
        '\'' => :raw
      }.freeze

      # stand_alone_month:  L,       LL,     LLL,         LLLL, LLLLL
      # format_month:       M,       MM,     MMM,         MMMM, MMMMM
      # ruby/cldr:          to_s,    rjust2, abbreviated, wide, narrow
      # intl/js:            numeric, 2digit, short,       long, narrow

      # CLDR: 'h' => JS: hourCycle: h12, hour12: true
      # CLDR: 'H' => JS: hourCycle: h23, hour12: false
      # CLDR: 'K' => JS: hourCycle: h24, hour12: false
      # CLDR: 'k' => JS: hourCycle: h11, hour12: true

      def raw(_date, pattern, _length)
        pattern[1...-1]
      end

      def era(date, _pattern, length)
        key = 0

        case length
        when 1..3
          calendar.dig(:eras, :abbr, key)
        when 4
          calendar.dig(:eras, :name, key)
        when 5
          calendar.dig(:eras, :narrow, key)
        end
      end

      def year(date, _pattern, length)
        year = date.year.to_s
        year = year.length == 1 ? year : year[-2, 2] if length == 2
        year = year.rjust(length, '0') if length > 1
        year
      end

      def year_of_week_of_year(_date, _pattern, _length)
        raise 'not implemented'
      end

      def day_of_week_in_month(_date, _pattern, _length) # e.g. 2nd Wed in July
        raise 'not implemented'
      end

      def quarter(date, _pattern, length)
        quarter = (date.month.to_i - 1) / 3 + 1
        case length
        when 1
          quarter.to_s
        when 2
          quarter.to_s.rjust(length, '0')
        when 3
          calendar[:quarters][:format][:abbreviated][quarter]
        when 4
          calendar[:quarters][:format][:wide][quarter]
        end
      end

      def quarter_stand_alone(date, _pattern, length)
        quarter = (date.month.to_i - 1) / 3 + 1
        case length
        when 1
          quarter.to_s
        when 2
          quarter.to_s.rjust(length, '0')
        when 3
          # raise 'not yet implemented (requires cldr\'s "multiple inheritance")'
          calendar[:quarters][:'stand-alone'][:abbreviated][key]
        when 4
          # raise 'not yet implemented (requires cldr\'s "multiple inheritance")'
          calendar[:quarters][:'stand-alone'][:wide][key]
        when 5
          calendar[:quarters][:'stand-alone'][:narrow][quarter]
        end
      end

      def month(date, _pattern, length)
        case length
        when 1
          date.month.to_s
        when 2
          date.month.to_s.rjust(length, '0')
        when 3
          calendar[:months][:format][:abbreviated][date.month]
        when 4
          calendar[:months][:format][:wide][date.month]
        when 5
          # raise 'not yet implemented (requires cldr\'s "multiple inheritance")'
          calendar[:months][:format][:narrow][date.month]
        else
          # raise unknown date format
        end
      end

      def month_stand_alone(date, _pattern, length)
        number_suffix = calendar[:months][:"stand-alone"][:abbreviated][1].end_with?('月') ? '月' : ''
        # abbr_suffix = (calendar[:months][:"stand-alone"][:abbreviated][1] =~ /^[jJ]an$/) ? "." : ""
        abbr_suffix = ''
        case length
        when 1
          date.month.to_s + number_suffix
        when 2
          date.month.to_s.rjust(length, '0') + number_suffix
        when 3
          # raise 'not yet implemented (requires cldr\'s "multiple inheritance")'
          calendar[:months][:'stand-alone'][:abbreviated][date.month]
        when 4
          # raise 'not yet implemented (requires cldr\'s "multiple inheritance")'
          calendar[:months][:'stand-alone'][:wide][date.month]
        when 5
          calendar[:months][:'stand-alone'][:narrow][date.month]
        else
          # raise unknown date format
        end
      end

      def day(date, _pattern, length)
        case length
        when 1
          date.day.to_s
        when 2
          date.day.to_s.rjust(length, '0')
        end
      end

      WEEKDAY_KEYS = %i[sun mon tue wed thu fri sat].freeze

      def weekday(date, _pattern, length)
        key = WEEKDAY_KEYS[date.wday]
        case length
        when 1..3
          calendar[:days][:format][:abbreviated][key]
        when 4
          calendar[:days][:format][:wide][key]
        when 5
          calendar[:days][:'stand-alone'][:narrow][key]
        end
      end

      def weekday_local(_date, _pattern, _length)
        # "Like E except adds a numeric value depending on the local starting day of the week"
        raise 'not implemented (need to defer a country to lookup the local first day of week from weekdata)'
      end

      def weekday_local_stand_alone(_date, _pattern, _length)
        raise 'not implemented (need to defer a country to lookup the local first day of week from weekdata)'
      end

      def period(time, _pattern, _length)
        calendar[:periods][:format][:wide][time.strftime('%p').downcase.to_sym]
      end

      def hour(time, pattern, length)
        hour = time.hour
        hour = case pattern[0, 1]
               when 'h' # [1-12]
                 if hour > 12
                   hour - 12
                 else
                   (hour == 0 ? 12 : hour)
                 end
               when 'H' # [0-23]
                 hour
               when 'K' # [0-11]
                 hour > 11 ? hour - 12 : hour
               when 'k' # [1-24]
                 hour == 0 ? 24 : hour
               end
        length == 1 ? hour.to_s : hour.to_s.rjust(length, '0')
      end

      def minute(time, _pattern, length)
        length == 1 ? time.min.to_s : time.min.to_s.rjust(length, '0')
      end

      def second(time, _pattern, length)
        length == 1 ? time.sec.to_s : time.sec.to_s.rjust(length, '0')
      end

      def second_fraction(time, _pattern, length)
        raise 'can not use the S format with more than 6 digits' if length > 6

        (time.usec.to_f / 10**(6 - length)).round.to_s.rjust(length, '0')
      end

      def timezone(time, _pattern, length)
        case length
        when 1..3
          time.zone
        else
          raise 'not yet implemented (requires timezone translation data")'
        end
      end

      def timezone_generic_non_location(_time, _pattern, _length)
        raise 'not yet implemented (requires timezone translation data")'
      end

      def round_to(number, precision)
        factor = 10**precision
        (number * factor).round.to_f / factor
      end
    end
  end
end

module Ruby
  module Intl
    GREGORIAN = {}.freeze

    class DateTimeFormat
      DEFAULT_OPTIONS = {
        'es' => { day: 'numeric', month: 'numeric', year: 'numeric' },
        'en-GB' => { day: '2-digit', month: '2-digit', year: 'numeric' },
        'en-CA' => { day: '2-digit', month: '2-digit', year: 'numeric' },
        'en-AU' => { day: '2-digit', month: '2-digit', year: 'numeric' },
        'en' => { day: 'numeric', month: 'numeric', year: 'numeric' },
        'ca' => { day: 'numeric', month: 'numeric', year: 'numeric' },
        'de' => { day: 'numeric', month: 'numeric', year: 'numeric' },
        'pt' => { day: '2-digit', month: '2-digit', year: 'numeric', fractionalSecondDigits: 0 },
        'ja' => { day: 'numeric', month: 'numeric', year: 'numeric' },
        'fr' => { day: '2-digit', month: '2-digit', year: 'numeric' }
      }.freeze

      DEFAULT_HOUR_OPTIONS = {
        'ca' => { hour12: false, hourCycle: 'h23', fractionalSecondDigits: 0 },
        'de' => { hour12: false, hourCycle: 'h23', fractionalSecondDigits: 0 },
        'en' => { hour12: true, hourCycle: 'h12', fractionalSecondDigits: 0 },
        'en-AU' => { hour12: true, hourCycle: 'h12', fractionalSecondDigits: 0 },
        'en-CA' => { hour12: true, hourCycle: 'h12', fractionalSecondDigits: 0 },
        'en-GB' => { hour12: false, hourCycle: 'h23', fractionalSecondDigits: 0 },
        'es' => { hour12: false, hourCycle: 'h23', fractionalSecondDigits: 0 },
        'es-ES' => { hour12: false, hourCycle: 'h23', fractionalSecondDigits: 0 },
        'fr' => { hour12: false, hourCycle: 'h23', fractionalSecondDigits: 0 },
        'ja' => { hour12: false, hourCycle: 'h23', fractionalSecondDigits: 0 },
        'pt' => { hour12: false, hourCycle: 'h23', fractionalSecondDigits: 0 }
      }.freeze

      def initialize(locale, **options)
        # {
        #   weekday: 'narrow' | 'short' | 'long',
        #   era: 'narrow' | 'short' | 'long',
        #   year: 'numeric' | '2-digit',
        #   month: 'numeric' | '2-digit' | 'narrow' | 'short' | 'long',
        #   day: 'numeric' | '2-digit',
        #   hour: 'numeric' | '2-digit',
        #   minute: 'numeric' | '2-digit',
        #   second: 'numeric' | '2-digit',
        #   timeZoneName: 'short' | 'long',

        #   // Time zone to express it in
        #   timeZone: 'Asia/Shanghai',
        #   // Force 12-hour or 24-hour
        #   hour12: true | false,

        #   // Rarely-used options
        #   hourCycle: 'h11' | 'h12' | 'h23' | 'h24',
        #   formatMatcher: 'basic' | 'best fit'
        # }

        @locale = Ruby::Intl.get_canonical_locales(locale).first
        @lang = locale.split(/-|_/).first
        @options = options.reject { |k, v| [:timeZone].include?(k) } == {} ? options.merge(default_options) : options
        @options = default_hour_options.merge(@options) if options[:hour]
      end

      def fetch_by_locale(hash)
        hash.fetch(@locale) { hash.fetch(@lang) }
      end

      def format(datetime)
        # gregorian["months"]["format"]["wide"][(datetime.month + 1).to_s] if format_options == {"month" => "long" }

        icu = to_icu(format_options)

        calendar = fetch_by_locale(Ruby::Intl::CALENDAR)
        calendar_lang = Ruby::Intl::CALENDAR.fetch(@lang)

        calendar[:months] ||= calendar_lang[:months]
        calendar[:days] ||= calendar_lang[:days]
        calendar[:periods] ||= calendar_lang[:periods]
        calendar[:fields] ||= calendar_lang[:fields]
        calendar[:months][:"stand-alone"] ||= calendar_lang[:months][:"stand-alone"]
        calendar[:months][:"stand-alone"][:abbreviated] ||= calendar[:months][:format][:abbreviated]
        calendar[:months][:"stand-alone"][:abbreviated] ||= calendar_lang[:months][:"stand-alone"][:abbreviated]
        calendar[:months][:"stand-alone"][:wide] ||= calendar_lang[:months][:"stand-alone"][:wide]
        calendar[:months][:"stand-alone"][:wide] ||= calendar[:months][:wide]
        calendar[:months][:"stand-alone"][:wide] ||= calendar[:months][:format][:wide]
        calendar[:months][:format][:wide] ||= calendar_lang[:months][:format][:wide]

        calendar[:days][:"stand-alone"] ||= calendar_lang[:days][:"stand-alone"]
        calendar[:days][:"stand-alone"][:abbreviated] ||= calendar[:days][:format][:abbreviated]
        calendar[:days][:"stand-alone"][:abbreviated] ||= calendar_lang[:days][:"stand-alone"][:abbreviated]
        calendar[:days][:"stand-alone"][:wide] ||= calendar_lang[:days][:"stand-alone"][:wide]
        calendar[:days][:"stand-alone"][:wide] ||= calendar[:days][:wide]
        calendar[:days][:"stand-alone"][:wide] ||= calendar[:days][:format][:wide]
        calendar[:days][:format][:wide] ||= calendar_lang[:days][:format][:wide]

        calendar[:periods][:format][:abbreviated][:am] ||= calendar_lang[:periods][:format][:abbreviated][:am]
        calendar[:periods][:format][:abbreviated][:pm] ||= calendar_lang[:periods][:format][:abbreviated][:pm]


        calendar[:periods][:format][:wide][:am] ||= calendar[:periods][:format][:narrow][:am]
        calendar[:periods][:format][:wide][:pm] ||= calendar[:periods][:format][:narrow][:pm]


        # p format_options: format_options, icu: icu

        return format_options unless icu

        if icu.is_a?(Array)
          format_date = Cldr::Format::MyDateTime.new(icu[1], calendar).apply(convert_zone(datetime))
          format_time = Cldr::Format::MyDateTime.new(icu[2], calendar).apply(convert_zone(datetime))
          icu[0].gsub('{0}', format_date).gsub('{1}', format_time)
        else
          Cldr::Format::MyDateTime.new(icu, calendar).apply(convert_zone(datetime))
        end
      end

      def convert_zone(ts, to_zone = 'Europe/Madrid')
        original_zone = ENV['TZ']
        utc_time = ts.to_time.dup.gmtime
        ENV['TZ'] = to_zone
        to_zone_time = utc_time.localtime
        ENV['TZ'] = original_zone
        to_zone_time.to_datetime
      end


      def self.load_formats
        filename = "cldr/formats.yaml"
        YAML.load(File.read(filename))
      end

      F = load_formats.freeze


      HOUR_CYCLES = {nil => "", "h12" => 'h', "h23" => 'H', "h24" => 'K', "h11" => 'k'}

      def to_icu(format_options)
        return 'L' if format_options == { 'month' => 'numeric' }
        return 'LL' if format_options == { 'month' => '2-digit' }
        return 'LLL' if format_options == { 'month' => 'short' }
        return 'LLLL' if format_options == { 'month' => 'long' }
        return 'LLLLL' if format_options == { 'month' => 'narrow' }

        # return 'E' if format_options == { 'weekday' => 'numeric' }
        # return 'EE' if format_options == { 'weekday' => '2-digit' }
        # return 'EEE' if format_options == { 'weekday' => 'short' }
        # return 'EEEE' if format_options == { 'weekday' => 'long' }
        # return 'EEEEE' if format_options == { 'weekday' => 'narrow' }

        f = F[@lang].merge(F[@locale] || {})

        key = String.new
        key << mult("G", format_options["era"])
        key << mult("y", format_options["year"])
        key << mult("M", format_options["month"])
        key << mult("E", format_options["weekday"])
        key << mult("d", format_options["day"])
        key << mult(HOUR_CYCLES[format_options["hourCycle"]], format_options["hour"])
        key << mult("m", format_options["minute"])
        key << "a" if format_options["hour12"]
        f[key] || "'#{@locale} #{key}'"
      end

      def mult(chr, js_option)
        js_option_value = {
          nil => 0,
          'numeric' => 1,
          '2-digit' => 2,
          'short' => 3,
          'long' => 4,
          'narrow' => 5,
        }.fetch(js_option)

        chr * js_option_value
      end

      def gregorian
        @gregorian ||= (GREGORIAN[@locale] ||= cldr)
      end

      def cldr
        load_cldr(@locale) || load_cldr(@lang)
      end

      def load_cldr(locale)
        filename = "cldr/#{locale}/ca-gregorian.json"
        YAML.load(File.read(filename))['main'][locale]['dates']['calendars']['gregorian'] if File.exist?(filename)
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
        # Javascript::Intl::DateTimeFormat.new(@locale, @options).resolved_options
        face_patch_resolved_options(options)
      end

      def options
        @_options ||= patch_resolved_options(default_resolved_options.merge(@options).transform_keys(&:to_s))
      end

      def format_options
        options.slice('day', 'month', 'year', 'weekday', 'hour', 'minute', 'hourCycle', 'hour12', 'era')
      end

      def default_options
        DEFAULT_OPTIONS.fetch(@locale) { DEFAULT_OPTIONS.fetch(@lang) }
      end

      def default_hour_options
        DEFAULT_HOUR_OPTIONS.fetch(@locale) { DEFAULT_HOUR_OPTIONS.fetch(@lang) }
      end

      def default_resolved_options
        {
          calendar: 'gregory',
          locale: @locale,
          numberingSystem: 'latn',
          fractionalSecondDigits: 0,
          timeZone: 'Europe/Madrid' # more than locale?
        }
      end

      def patch_resolved_options(options)
        options['month'] = 'numeric' if options['locale'] == 'ja' && options['month'] == 'narrow'
        options['month'] = 'numeric' if options['locale'] == 'ja' && options['month'] == 'long'
        options['month'] = 'numeric' if options['locale'] == 'ja' && options['month'] == 'short'

        # options["month"] = "2-digit" if options["locale"] == "pt-PT" && options["month"] == "short"

        options
      end

      def face_patch_resolved_options(options)
        # options = options.dup
        # options["month"] = "numeric" if options["locale"] == "ja" && options["month"] == "narrow"
        # options["month"] = "numeric" if options["locale"] == "ja" && options["month"] == "long"
        # options["month"] = "numeric" if options["locale"] == "ja" && options["month"] == "short"
        options
      end
    end
  end
end

# http://userguide.icu-project.org/formatparse/datetime
# | Date Field Symbol Table   |
# | ------------------------- |
# | Symbol                    | Meaning                                                             | Example(s)                         |
# | G                         | era designator                                                      | G, GG, or GGG, GGGG, GGGGG         | AD, Anno Domini, A                                                          |
# | y                         | year                                                                | yy, y or yyyy                      | 96, 1996                                                                    |
# | Y                         | year of "Week of Year"                                              | Y                                  | 1997                                                                        |
# | u                         | extended year                                                       | u                                  | 4601                                                                        |
# | U                         | cyclic year name, as in Chinese lunar calendar                      | U                                  | 甲子                                                                        |
# | r                         | related Gregorian year                                              | r                                  | 1996                                                                        |
# | Q                         | quarter                                                             | Q, Q, QQQ, QQQQ, QQQQQ             | 2, 2, Q2, 2nd quarter, 2                                                    |
# | q                         | Stand Alone quarter                                                 | q, /i>qq, qqq, qqqq, qqqqq         | 2, 2, Q2, 2nd quarter, 2                                                    |
# | M                         | month in year                                                       | M, M, MMM, MMMM, MMMMM             | 9, 9, Sep, September, S                                                     |
# | L                         | Stand Alone month in year                                           | L, L, LLL, LLLL, LLLLL             | 9, 9, Sep, September, S                                                     |
# | w                         | week of year                                                        | w, w                               | 27, 7                                                                       |
# | W\                        | week of month                                                       | W                                  | 2                                                                           |
# | d                         | day in month                                                        | d, dd                              | 2, 02                                                                       |
# | D                         | day of year                                                         | D                                  | 189                                                                         |
# | F                         | day of week in month                                                | F                                  | 2 (2nd Wed in July)                                                         |
# | g                         | modified julian day                                                 | g                                  | 2451334                                                                     |
# | E                         | day of week                                                         | E, EE, or EEE, EEEE, EEEEE, EEEEEE | Tue, Tuesday, T, Tu                                                         |
# | e                         | local day of week,  example: if Monday is 1st day, Tuesday is 2nd ) | e or ee, eee, eeee, eeeee, eeeeee  | 2, Tue, Tuesday, T, Tu                                                      |
# | c                         | Stand Alone local day of week                                       | c or cc, ccc, cccc, ccccc, cccccc  | 2, Tue, Tuesday, T, Tu                                                      |
# | a                         | am/pm marker                                                        | a                                  | pm                                                                          |
# | h                         | hour in am/pm (1~12)                                                | h, hh                              | 7, 07                                                                       |
# | H                         | hour in day (0~23)                                                  | H, HH                              | 0, 00                                                                       |
# | k                         | hour in day (1~24)                                                  | k, kk                              | 24, 24                                                                      |
# | K                         | hour in am/pm (0~11)                                                | K, KK                              | 0, 00                                                                       |
# | m                         | minute in hour                                                      | m, mm                              | 4, 04                                                                       |
# | s                         | second in minute                                                    | s, ss                              | 5, 05                                                                       |
# | S                         | fractional second                                                   | S, SS, SSS, SSSS                   | 2, 23, 235, 2350                                                            |
# | A                         | milliseconds in day                                                 | A                                  | 61201235                                                                    |
# | z                         | Time Zone: (...)                                                    | z, zz, or zzz, zzzz                | PDT, Pacific Daylight Time                                                  |
# | Z                         | Time Zone: (...)                                                    | Z, ZZ, or ZZZ, ZZZZ, ZZZZZ         | -0800, GMT-08:00, -08:00, -07:52:58, Z                                      |
# | O                         | Time Zone: (...)                                                    | O, OOOO                            | GMT-8, GMT-08:00                                                            |
# | v                         | Time Zone: (...)                                                    | v, vvvv                            | PT, Pacific Time or Los Angeles Time                                        |
# | V                         | Time Zone: (...)                                                    | V, VV, VVV, VVVV                   | uslax, America/Los_Angeles, Los Angeles, Los Angeles Time                   |
# | X                         | Time Zone: (...)                                                    | X, XX, XXX, XXXX, XXXXX            | -08, +0530, Z, -0800, Z, -08:00, Z, -0800, -075258, Z, -08:00, -07:52:58, Z |
# | x                         | Time Zone: (...)                                                    | x, xx, xxx, xxxx, xxxxx            | -08, +0530, -0800, -08:00, -0800, -075258, -08:00, -07:52:58                |
# | '                         | escape for text                                                     | '                                  | (nothing)                                                                   |
# | ' '                       | two single quotes produce one                                       | ' '                                | '                                                                           |
