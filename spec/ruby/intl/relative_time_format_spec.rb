# frozen_string_literal: true
RSpec.describe Ruby::Intl::RelativeTimeFormat do
  values = {
    "this": 0,
    "1": 1,
    # "2": 2,
    # "3": 3,
    "5": 5,
    "10": 10,
    "-1": -1,
    # "-2": -2,
    # "-3": -3,
    # "-5": -5,
    "-10": -10
  }

  units = {
    # "year": 'year',
    # "quarter": 'quarter',
    # "month": 'month',
    # "week": 'week',
    # "day": 'day',
    "hour": 'hour',
    "minute": 'minute',
    "second": 'second'
  }

  relative_optionss = {
    # "none": {},
    # "auto": { numeric: 'auto' },
    # "numeric": { numeric: 'always' },
    # "numeric-long": { numeric: 'always', style: 'long' },
    # "short": { style: 'short' },
    # "auto-short": { numeric: 'auto', style: 'short' },
    "narrow": { style: 'narrow' }
  }

  locales = {
    "en": 'en',
    "us": 'en-us',
    "gb": 'en-gb',
    "en-ca": 'en-ca',
    "au": 'en-au',
    "ca": 'ca',
    "de": 'de',
    "ja": 'ja',
    "es": 'es-es',
    "fr": 'fr-fr',
    "pt": 'pt-pt',
    "br": 'pt-br',
  }

  locales.each do |locale_name, locale_value|
    relative_optionss.each do |relative_options_name, relative_options_value|
      values.each do |value_name, value_value|
        units.each do |unit_name, unit_value|
          expected1 = Javascript::Intl::RelativeTimeFormat.new(locale_value, relative_options_value).format(value_value, unit_value)

          next if unit_value == "day" and locale_value == "pt-pt" and value_value < 0

          it "#{value_name} #{unit_name} on #{locale_name} in #{relative_options_name} should be `#{expected1}`" do
            expect(Ruby::Intl::RelativeTimeFormat.new(locale_value, relative_options_value).format(value_value, unit_value)).to eq(expected1)
          end

          next unless CHECK_PARTS

          expected2 = Javascript::Intl::RelativeTimeFormat.new(locale_value, relative_options_value).format_to_parts(value_value, unit_value)
          it "#{value_name} #{unit_name} on #{locale_name} in #{relative_options_name} should be `#{expected2}`" do
            expect(Ruby::Intl::RelativeTimeFormat.new(locale_value, relative_options_value).format_to_parts(value_value, unit_value)).to eq(expected2)
          end
        end
      end

      expected3 = Javascript::Intl::RelativeTimeFormat.new(locale_value, relative_options_value).resolved_options
      it "resolved_options on #{locale_name} in #{relative_options_name} should be `#{expected3}`" do
        expect(Ruby::Intl::RelativeTimeFormat.new(locale_value, relative_options_value).resolved_options).to eq(expected3)
      end
    end
  end
end
