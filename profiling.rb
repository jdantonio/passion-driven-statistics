require 'ratistics'

require_relative 'lib/utilities'
require_relative 'lib/addhealth'
require_relative 'lib/crater'
require_relative 'lib/gapminder'
require_relative 'lib/nesarc'

require 'pp'
require 'ruby-prof'

puts "\n==============================================\n\n"

Utilities.with_timer do
  Ratistics::Load::Csv.file(Gapminder::CSV_FILE, as: :hash, def: Gapminder::CSV_DEFINITION, headers: true, encoding: :force, as: :frame)
end
Utilities.with_timer do
  Ratistics::Load::Csv.file(Gapminder::CSV_FILE, as: :hash, def: Gapminder::CSV_DEFINITION, headers: true, encoding: :force, as: :frame, hamster: true)
end

puts "\n----------------------------------------------\n\n"

Utilities.with_timer do
  Ratistics::Load::Csv.file(Addhealth::CSV_FILE, as: :catalog, def: Addhealth::CSV_DEFINITION, headers: true, encoding: :force, as: :frame)
end
Utilities.with_timer do
  Ratistics::Load::Csv.file(Addhealth::CSV_FILE, as: :catalog, def: Addhealth::CSV_DEFINITION, headers: true, encoding: :force, as: :frame, hamster: true)
end

puts "\n----------------------------------------------\n\n"

Utilities.with_timer do
  Ratistics::Load::Csv.file(Nesarc::CSV_FILE, as: :frame, def: Nesarc::CSV_DEFINITION, headers: true, encoding: :force, as: :frame)
end
Utilities.with_timer do
  Ratistics::Load::Csv.file(Nesarc::CSV_FILE, as: :frame, def: Nesarc::CSV_DEFINITION, headers: true, encoding: :force, as: :frame, hamster: true)
end

puts "\n----------------------------------------------\n\n"

Utilities.with_timer do
  Ratistics::Load::Csv.file(Crater::CSV_FILE, as: :frame, def: Crater::CSV_DEFINITION, headers: true, encoding: :force, as: :frame)
end
Utilities.with_timer do
  Ratistics::Load::Csv.file(Crater::CSV_FILE, as: :frame, def: Crater::CSV_DEFINITION, headers: true, encoding: :force, as: :frame, hamster: true)
end

puts "\n==============================================\n\n"

#result = RubyProf.profile do
  #Ratistics::Load::Csv.file(Crater::CSV_FILE, as: :frame, def: Crater::CSV_DEFINITION, headers: true)
#end

#printer = RubyProf::FlatPrinter.new(result)
#printer.print(STDOUT)

#==============================================

#Started timer at 2013-03-28 15:17:58 -0400...
#Time elapsed 0.022038008 seconds
#Started timer at 2013-03-28 15:17:58 -0400...
#Time elapsed 0.024870835 seconds

#----------------------------------------------

#Started timer at 2013-03-28 15:17:58 -0400...
#Time elapsed 1.692523007 seconds
#Started timer at 2013-03-28 15:18:00 -0400...
#Time elapsed 1.82674888 seconds

#----------------------------------------------

#Started timer at 2013-03-28 15:18:02 -0400...
#Time elapsed 15.176747364 seconds
#Started timer at 2013-03-28 15:18:17 -0400...
#Time elapsed 12.847821387 seconds

#----------------------------------------------

#Started timer at 2013-03-28 15:18:30 -0400...
#Time elapsed 17.298123995 seconds
#Started timer at 2013-03-28 15:18:47 -0400...
#Time elapsed 22.971795488 seconds

#==============================================
