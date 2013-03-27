require 'ratistics'

require_relative 'lib/utilities'
require_relative 'lib/crater'

require 'pp'
require 'ruby-prof'

contents = Ratistics::Loader.file_contents(Crater::CSV_FILE)

craters = Utilities.with_timer do
  #Ratistics::Loader.frame_from_csv_data_using_headers(contents, headers: false)
  #Ratistics::Loader.frame_from_csv_data_using_headers(contents, headers: true)
  #Ratistics::Loader.frame_from_csv_data_using_definition(contents, def: Crater::CSV_DEFINITION, headers: false)
  #Ratistics::Loader.frame_from_csv_data_using_definition(contents, def: Crater::CSV_DEFINITION, headers: true)
  #Ratistics::Loader.catalog_from_csv_data_using_headers(contents, headers: true)
  #Ratistics::Loader.catalog_from_csv_data_using_headers(contents, headers: false)
  #Ratistics::Loader.catalog_from_csv_data_using_definition(contents, def: Crater::CSV_DEFINITION, headers: false)
  Ratistics::Loader.catalog_from_csv_data_using_definition(contents, def: Crater::CSV_DEFINITION, headers: true)
end

p craters.length
p craters.first
p craters.last

#result = RubyProf.profile do
  #craters = Utilities.with_timer{Crater.load2}
  #craters = Utilities.with_timer{Crater.load3}
#end

#printer = RubyProf::FlatPrinter.new(result)
#printer.print(STDOUT)
