RSpec.describe Ruby::Intl do
  it 'has a version number' do
    expect(Ruby::Intl::VERSION).not_to be nil
  end

  locales = %w[en en-us en-gb en-ca en-au es-es fr-fr ca de pt-pt pt-br ja en-US EN-US En-Us es]

  locales.each do |locale|
    expected1 = Javascript::Intl.get_canonical_locales(locale)
    it "canonical_locales of #{locale} should be #{expected1}" do
      expect(Ruby::Intl.get_canonical_locales(locale)).to eq(expected1)
    end
  end
end
