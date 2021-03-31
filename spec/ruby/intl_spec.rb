require "yaml"
Javascript::Intl.cache = true
Javascript::Intl.storage.update(YAML.load(File.read("storage.yml"))) if File.exists?("storage.yml")

RSpec.configure do |config|
  config.after(:all) { File.write("storage.yml", Javascript::Intl.storage.to_yaml) }
end

RSpec.describe Ruby::Intl do
  it 'has a version number' do
    expect(Ruby::Intl::VERSION).not_to be nil
  end

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

  values = {
    "1": 1,
    "2": 2,
    "3": 3,
    "5": 5,
    "10": 10,
    "-1": -1,
    "-2": -2,
    "-3": -3,
    "-5": -5,
    "-10": -10,
  }

  units = {
    "year": "year",
    "quarter": "quarter",
    "month": "month",
    "week": "week",
    "day": "day",
    "hour": "hour",
    "minute": "minute",
    "second": "second",
  }

  relative_optionss = {
    "none": { },
    "auto": {numeric: 'auto' },
    "numeric": {numeric: 'always' },
    "numeric-long": {numeric: 'always', style: 'long' },
    "short": { style: 'short' },
    "auto-short": { numeric: 'auto', style: 'short' },
    "narrow": { style: 'narrow' }
  }

  locales = {
    "en": 'en',
    "us": 'en-us',
    "gb": 'en-gb',
    "en-ca": 'en-ca',
    "au": 'en-au',
    "es": 'es-es',
    "fr": 'fr-fr',
    "ca": 'ca',
    "de": 'de',
    "pt": 'pt-pt',
    "br": 'pt-br',
    "ja": 'ja'
  }

  locales.each do |locale_name, locale_value|
    date_time_optionss.each do |date_time_options_name, date_time_options_value|
      dates.each do |date_name, date_value|
        expected1 = Javascript::Intl::DateTimeFormat.new(locale_value, date_time_options_value).format(date_value)
        it "#{date_name} on #{locale_name} in #{date_time_options_name} should be #{expected1}" do
          expect(Ruby::Intl::DateTimeFormat.new(locale_value, date_time_options_value).format(date_value)).to eq(expected1)
        end

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

    relative_optionss.each do |relative_options_name, relative_options_value|
      values.each do |value_name, value_value|
        units.each do |unit_name, unit_value|
          expected1 = Javascript::Intl::RelativeTimeFormat.new(locale_value, relative_options_value).format(value_value, unit_value)
          it "#{value_name} #{unit_name} on #{locale_name} in #{relative_options_name} should be #{expected1}" do
            expect(Ruby::Intl::RelativeTimeFormat.new(locale_value, relative_options_value).format(value_value, unit_value)).to eq(expected1)
          end

          expected2 = Javascript::Intl::RelativeTimeFormat.new(locale_value, relative_options_value).format_to_parts(value_value, unit_value)
          it "#{value_name} #{unit_name} on #{locale_name} in #{relative_options_name} should be #{expected2}" do
            expect(Ruby::Intl::RelativeTimeFormat.new(locale_value, relative_options_value).format_to_parts(value_value, unit_value)).to eq(expected2)
          end
        end
      end

      expected3 = Javascript::Intl::RelativeTimeFormat.new(locale_value, relative_options_value).resolved_options
      it "resolved_options on #{locale_name} in #{relative_options_name} should be #{expected3}" do
        expect(Ruby::Intl::RelativeTimeFormat.new(locale_value, relative_options_value).resolved_options).to eq(expected3)
      end
    end
  end
end
