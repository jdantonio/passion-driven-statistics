require 'ratistics'

require_relative 'lib/utilities'
require_relative 'lib/crater'

require 'pp'
require 'ruby-prof'

puts "\n==============================================\n"

craters = Utilities.with_timer do
  craters = Ratistics::Loader.csv_file(Crater::CSV_FILE, as: :hash, def: Crater::CSV_DEFINITION, headers: true)
end
p craters.length
p craters.first
p craters.last

puts "\n----------------------------------------------\n"

craters = Utilities.with_timer do
  craters = Ratistics::Loader.csv_file(Crater::CSV_FILE, as: :catalog, def: Crater::CSV_DEFINITION, headers: true)
end
p craters.length
p craters.first
p craters.last

puts "\n----------------------------------------------\n"

craters = Utilities.with_timer do
  craters = Ratistics::Loader.csv_file(Crater::CSV_FILE, as: :frame, def: Crater::CSV_DEFINITION, headers: true)
end
p craters.length
p craters.first
p craters.last

puts "\n==============================================\n"

#result = RubyProf.profile do
  #craters = Utilities.with_timer{Crater.load2}
  #craters = Utilities.with_timer{Crater.load3}
#end

#printer = RubyProf::FlatPrinter.new(result)
#printer.print(STDOUT)
