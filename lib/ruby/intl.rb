require 'ruby/intl/version'

require 'date'
require 'javascript/intl'

module Ruby
  module Intl
    class Error < StandardError; end

    def self.get_canonical_locales(locales)
      lang, territory = locales.split("-")

      return ["#{lang.downcase}-#{territory.upcase}"] if territory
      [lang.downcase]
    end
  end
end

require_relative './intl/date_time_format'
require_relative './intl/relative_time_format'
