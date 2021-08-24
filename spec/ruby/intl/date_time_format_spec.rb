# frozen_string_literal: true
RSpec.describe Ruby::Intl::DateTimeFormat do
  startDate = DateTime.new(2007, 1, 5, 14, 0, 0, 'Z')
  endDate1 = DateTime.new(2007, 1, 6, 15, 0, 0, 'Z') # next day
  endDate2 = DateTime.new(2007, 2, 5, 15, 0, 0, 'Z') # next month
  endDate3 = DateTime.new(2008, 1, 5, 15, 0, 0, 'Z') # next year

  dates = {
    "startDate": startDate
  }

  ranges = {
    "same month": [startDate, endDate1],
    "change month": [startDate, endDate2],
    "change year": [startDate, endDate3]
  }


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
  date_time_optionss = {
    # "month-long": { month: 'long' }, # not implemented
    # "month-short": { month: 'short' }, # not implemented


    # # "none": {},
    # "month-numeric": { month: 'numeric' },
    # "month-narrow": { month: 'narrow' },
    # "month-2-digit": { month: '2-digit' },


    # # "month-2-digit": { month: '2-digit', timeZone: 'Australia/Sydney', timeZoneName: 'short'},


    # "long": { year: 'numeric', month: 'long', day: 'numeric' },
    # "short": { month: 'short', day: 'numeric' },
    # "m-short-d-numeric": { month: 'short', day: 'numeric' },
    # "w-long-h-2-digit-m-2-digit": { weekday: 'long', hour: '2-digit', minute: '2-digit' },
    # "w-long-m-long-d-numeric": { weekday: 'long', month: 'long', day: 'numeric' },
    # "w-long-y-numeric-m-long-d-numeric": { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' },
    # "w-long-y-numeric-m-long-d-numeric-h-2-digit-m-2-digit": { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit' },
    # "w-long": { weekday: 'long' },
    # "w-short-y-numeric-m-short-d-numeric": { weekday: 'short', year: 'numeric', month: 'short', day: 'numeric' },
    # "y-numeric-m-long-d-numeric": { year: 'numeric', month: 'long', day: 'numeric' },
    # "y-numeric-m-long-d-numeric-h-2-digit-m-2-digit": { year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit' }

    "generic-datetime": { weekday: 'long', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit'},
    "generic-date": { weekday: 'long', month: 'long', day: 'numeric' }
  }

  locales = {
    "en": 'en',
    "en-US": 'en-us',
    "en-gb": 'en-gb',
    "en-ca": 'en-ca',
    "au": 'en-au',
    "es-ES": 'es-es',
    "es": 'es',
    "fr": 'fr-fr',
    "ca": 'ca',
    "de": 'de',
    "pt": 'pt',
    "pt-pt": 'pt-pt',
    "br": 'pt-br',
    "ja": 'ja',
    # # "ja2": 'ja-Jpan-JP-u-ca-japanese-hc-h12'
  }

  locales.each do |locale_name, locale_value|
    date_time_optionss.each do |date_time_options_name, date_time_options_value|



      dates.each do |date_name, date_value|
        # next if unit_value == "day" and locale_value == "pt-pt" and value_value < 0
        # puts ["#{date_name} on #{locale_name} in #{date_time_options_name} should be", date_time_options_value, locale_value]

        expected1 = Javascript::Intl::DateTimeFormat.new(locale_value, date_time_options_value).format(date_value)
        it "#{date_name} on #{locale_name} in #{date_time_options_name} should be #{expected1}" do
          expect(Ruby::Intl::DateTimeFormat.new(locale_value, date_time_options_value).format(date_value)).to eq(expected1)
        end

        next unless CHECK_PARTS

        expected2 = Javascript::Intl::DateTimeFormat.new(locale_value, date_time_options_value).format_to_parts(date_value)
        it "#{date_name} on #{locale_name} in #{date_time_options_name} should be #{expected2}" do
          expect(Ruby::Intl::DateTimeFormat.new(locale_value, date_time_options_value).format_to_parts(date_value)).to eq(expected2)
        end
      end

      # ranges.each do |range_name, range_value|
      #   expected1 = Javascript::Intl::DateTimeFormat.new(locale_value, date_time_options_value).format_range(*range_value)
      #   it "#{range_name} on #{locale_name} in #{date_time_options_name} should be #{expected1}" do
      #     expect(Ruby::Intl::DateTimeFormat.new(locale_value, date_time_options_value).format_range(*range_value)).to eq(expected1)
      #   end

      #   next unless CHECK_PARTS

      #   expected2 = Javascript::Intl::DateTimeFormat.new(locale_value, date_time_options_value).format_range_to_parts(*range_value)
      #   it "#{range_name} on #{locale_name} in #{date_time_options_name} should be #{expected2}" do
      #     expect(Ruby::Intl::DateTimeFormat.new(locale_value, date_time_options_value).format_range_to_parts(*range_value)).to eq(expected2)
      #   end
      # end

      expected3 = Javascript::Intl::DateTimeFormat.new(locale_value, date_time_options_value).resolved_options
      it "resolved_options on #{locale_name} in #{date_time_options_name} should be #{expected3}" do
        expect(Ruby::Intl::DateTimeFormat.new(locale_value, date_time_options_value).resolved_options).to eq(expected3)
      end
    end
  end


  # it "random_test" do

  #   options = {
  #     weekday: [nil, 'narrow', 'short', 'long'],
  #     era: [nil, 'narrow', 'short', 'long'],
  #     year: [nil, 'numeric', '2-digit'],
  #     month: [nil, 'numeric', '2-digit', 'narrow', 'short', 'long'],
  #     day: [nil, 'numeric', '2-digit'],
  #     hour: [nil, 'numeric', '2-digit'],
  #     minute: [nil, 'numeric', '2-digit'],
  #     second: [nil, 'numeric', '2-digit'],
  #     timeZoneName: [nil, 'short', 'long'],
  #     hour12: [nil, true, false], # include a
  #     hourCycle: [nil, 'h11', 'h12', 'h23', 'h24'],
  #     # formatMatcher: ['basic', 'best fit'],
  #     timeZone: ['Europe/Madrid', 'Asia/Shanghai']
  #   }

  #   combinations =  options.reduce(1) { |acc, (_, v)| acc * (v.count)} # 2_099_520

  #   options = options.transform_values { |v| v[0] }.compact
  #   # options = options.transform_values { |v| v.sample }.compact

  #   datetime = DateTime.new(2001, 2, 3, 4, 5, 6, 'Z')
  #   # locale = "es-ES"

  #   rb_format = locales.values.map { |locale| locale + ": \n   " + Ruby::Intl::DateTimeFormat.new(locale, options).format(datetime) }.join("\n")
  #   js_format = locales.values.map { |locale| locale + ": \n   " + Javascript::Intl::DateTimeFormat.new(locale, options).format(datetime) }.join("\n")

  #   expect(rb_format).to eq(js_format)
  # end
end


# const date1 = new Date(2012, 5);
# // console.log(new Intl.DateTimeFormat('es-ES', { weekday: 'narrow', month: 'narrow' }).format(date1));
# // console.log(new Intl.DateTimeFormat('es-ES', { weekday: 'short', month: 'short' }).format(date1));
# // console.log(new Intl.DateTimeFormat('es-ES', { weekday: 'long', month: 'long' }).format(date1));
# > "J V"
# > "jun vie"
# > "junio viernes"

# MEEEEEHH => "2 S 6 (hora: 05)"
