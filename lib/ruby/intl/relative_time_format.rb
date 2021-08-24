# frozen_string_literal: true
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
        # Javascript::Intl::RelativeTimeFormat.new(@locale, @options).resolved_options
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

        # plural_rule = value_abs.localize(@locale).plural_rule
        plural_rule = plural_rule_for(value_abs)
        key = "relativeTimePattern-count-#{plural_rule}"

        if cldr[key]
          cldr[key].gsub('{0}', value_abs.to_s)
        else
          cldr['relativeTimePattern-count-other'].gsub('{0}', value_abs.to_s)
        end
      end


      # try: https://github.com/camertron/cldr-plurals-runtime-rb
      # exported by https://github.com/ruby-i18n/ruby-cldr
      PLURAL_RULE = {
        "ca" => lambda { |n| n = n.respond_to?(:abs) ? n.abs : ((m = n.to_s)[0] == "-" ? m[1,m.length] : m); (n.to_i == 1 && ((v = n.to_s.split(".")[1]) ? v.length : 0) == 0) ? :one : :other },
        "de" => lambda { |n| n = n.respond_to?(:abs) ? n.abs : ((m = n.to_s)[0] == "-" ? m[1,m.length] : m); (n.to_i == 1 && ((v = n.to_s.split(".")[1]) ? v.length : 0) == 0) ? :one : :other },
        "en" => lambda { |n| n = n.respond_to?(:abs) ? n.abs : ((m = n.to_s)[0] == "-" ? m[1,m.length] : m); (n.to_i == 1 && ((v = n.to_s.split(".")[1]) ? v.length : 0) == 0) ? :one : :other },
        "es" => lambda { |n| n = n.respond_to?(:abs) ? n.abs : ((m = n.to_s)[0] == "-" ? m[1,m.length] : m); n.to_f == 1 ? :one : :other },
        "fr" => lambda { |n| n = n.respond_to?(:abs) ? n.abs : ((m = n.to_s)[0] == "-" ? m[1,m.length] : m); [0, 1].include?(n.to_i) ? :one : :other },
        "ja" => lambda { |n| n = n.respond_to?(:abs) ? n.abs : ((m = n.to_s)[0] == "-" ? m[1,m.length] : m); :other },
        "pt" => lambda { |n| n = n.respond_to?(:abs) ? n.abs : ((m = n.to_s)[0] == "-" ? m[1,m.length] : m); (0..1).include?(n.to_i) ? :one : :other },
        "pt-PT" => lambda { |n| n = n.respond_to?(:abs) ? n.abs : ((m = n.to_s)[0] == "-" ? m[1,m.length] : m); (n.to_i == 1 && ((v = n.to_s.split(".")[1]) ? v.length : 0) == 0) ? :one : :other },
      }

      def plural_rule_for(value)
        PLURAL_RULE.fetch(@locale) { PLURAL_RULE.fetch(@lang) }.(value)
      end
    end
  end
end


















