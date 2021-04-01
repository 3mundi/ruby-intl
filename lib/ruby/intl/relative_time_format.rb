module Ruby
  module Intl
    DATE_FIELDS = {}

    class RelativeTimeFormat
      def initialize(locale, **options)
        @locale = Ruby::Intl.get_canonical_locales(locale).first
        @lang = locale.split(/-|_/).first
        @options = options
      end

      def date_fields
        @date_fields ||= (DATE_FIELDS[@locale] ||= cldr)
      end

      def cldr
        load_cldr(@locale) || load_cldr(@lang)
      end

      def load_cldr(locale)
        filename = "cldr/#{locale}/dateFields.json"
        YAML.load(File.read(filename))['main'][locale]['dates']['fields'] if File.exists?(filename)
      end

      def format(value, unit)
        unit_sing = unit.chomp('s')
        cldr = date_fields["#{unit_sing}-#{@options[:style]}"] || date_fields[unit_sing]
        format_unit(value, cldr)

        # format_to_parts(value, unit).map { |part| part['value'] }.join('')
      end

      def format_to_parts(value, unit)
        Javascript::Intl::RelativeTimeFormat.new(@locale, @options).format_to_parts(value, unit)
      end

      def resolved_options
        return default_resolved_options.merge(@options).transform_keys(&:to_s)
        Javascript::Intl::RelativeTimeFormat.new(@locale, @options).resolved_options
      end

      def default_resolved_options
        { locale: @locale, numberingSystem: 'latn', numeric: 'always', style: 'long' }
      end

      private

      def format_unit(value, cldr)
        value_abs = value.abs

        return cldr["relative-type-#{value}"] if @options[:numeric] == 'auto' && cldr["relative-type-#{value}"]

        if value < 0
          format_relative_type(value_abs, cldr['relativeTime-type-past'])
        else
          format_relative_type(value_abs, cldr['relativeTime-type-future'])
        end
      end

      def format_relative_type(value_abs, cldr)
        if value_abs == 1 && cldr['relativeTimePattern-count-one']
          cldr['relativeTimePattern-count-one'].gsub('{0}', value_abs.to_s)
        else
          cldr['relativeTimePattern-count-other'].gsub('{0}', value_abs.to_s)
        end
      end
    end
  end
end
