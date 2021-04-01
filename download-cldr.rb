%w[en en-US-POSIX en-GB en-CA en-AU es fr ca de pt-PT ja pt].each do |locale|
  `mkdir -p cldr/#{locale}`
  `curl https://raw.githubusercontent.com/unicode-org/cldr-json/master/cldr-json/cldr-dates-full/main/#{locale}/dateFields.json > cldr/#{locale}/dateFields.json`
  `curl https://raw.githubusercontent.com/unicode-org/cldr-json/master/cldr-json/cldr-dates-full/main/#{locale}/ca-gregorian.json > cldr/#{locale}/ca-gregorian.json`
end

`curl https://raw.githubusercontent.com/unicode-org/cldr-json/master/cldr-json/cldr-core/supplemental/plurals.json > cldr/plurals.json`
`curl https://raw.githubusercontent.com/unicode-org/cldr-json/master/cldr-json/cldr-core/supplemental/pluralRanges.json > cldr/pluralRanges.json`
