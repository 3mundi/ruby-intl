RSpec.describe Ruby::Intl::DateTimeFormat do
  startDate = DateTime.new(2007, 1, 10, 14, 0, 0, 'Z')
  endDate1 = DateTime.new(2007, 1, 11, 15, 0, 0, 'Z') # next day
  endDate2 = DateTime.new(2007, 2, 10, 15, 0, 0, 'Z') # next month
  endDate3 = DateTime.new(2008, 1, 10, 15, 0, 0, 'Z') # next year

  dates = {
    "startDate": startDate
  }

  ranges = {
    "same month": [startDate, endDate1],
    "change month": [startDate, endDate2],
    "change year": [startDate, endDate3]
  }

  date_time_optionss = {
    "none": {},
    "long": { year: 'numeric', month: 'long', day: 'numeric' },
    "m-short-d-numeric": { month: 'short', day: 'numeric' },
    "w-long-h-2-digit-m-2-digit": { weekday: 'long', hour: '2-digit', minute: '2-digit' },
    "w-long-m-long-d-numeric": { weekday: 'long', month: 'long', day: 'numeric' },
    "w-long-y-numeric-m-long-d-numeric": { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' },
    "w-long-y-numeric-m-long-d-numeric-h-2-digit-m-2-digit": { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit' },
    "w-long": { weekday: 'long' },
    "w-short-y-numeric-m-short-d-numeric": { weekday: 'short', year: 'numeric', month: 'short', day: 'numeric' },
    "y-numeric-m-long-d-numeric": { year: 'numeric', month: 'long', day: 'numeric' },
    "y-numeric-m-long-d-numeric-h-2-digit-m-2-digit": { year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit' }
  }

  locales = {
    # "en": 'en',
    # "us": 'en-us',
    # "gb": 'en-gb',
    # "en-ca": 'en-ca',
    # "au": 'en-au',
    "es": 'es-es'
    # "fr": 'fr-fr',
    # "ca": 'ca',
    # "de": 'de',
    # "pt": 'pt-pt',
    # "br": 'pt-br',
    # "ja": 'ja'
  }

  locales.each do |locale_name, locale_value|
    date_time_optionss.each do |date_time_options_name, date_time_options_value|
      dates.each do |date_name, date_value|
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

      ranges.each do |range_name, range_value|
        expected1 = Javascript::Intl::DateTimeFormat.new(locale_value, date_time_options_value).format_range(*range_value)
        it "#{range_name} on #{locale_name} in #{date_time_options_name} should be #{expected1}" do
          expect(Ruby::Intl::DateTimeFormat.new(locale_value, date_time_options_value).format_range(*range_value)).to eq(expected1)
        end

        next unless CHECK_PARTS

        expected2 = Javascript::Intl::DateTimeFormat.new(locale_value, date_time_options_value).format_range_to_parts(*range_value)
        it "#{range_name} on #{locale_name} in #{date_time_options_name} should be #{expected2}" do
          expect(Ruby::Intl::DateTimeFormat.new(locale_value, date_time_options_value).format_range_to_parts(*range_value)).to eq(expected2)
        end
      end

      expected3 = Javascript::Intl::DateTimeFormat.new(locale_value, date_time_options_value).resolved_options
      it "resolved_options on #{locale_name} in #{date_time_options_name} should be #{expected3}" do
        expect(Ruby::Intl::DateTimeFormat.new(locale_value, date_time_options_value).resolved_options).to eq(expected3)
      end
    end
  end
end
