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

#Started timer at 2013-03-28 00:13:05 -0400...
#Time elapsed 0.032706 seconds
#Started timer at 2013-03-28 00:13:05 -0400...
#Time elapsed 0.032155 seconds

#----------------------------------------------

#Started timer at 2013-03-28 00:13:05 -0400...
#Time elapsed 3.623061 seconds
#Started timer at 2013-03-28 00:13:09 -0400...
#Time elapsed 3.98155 seconds

#----------------------------------------------

#Started timer at 2013-03-28 00:13:13 -0400...
#Time elapsed 27.822825 seconds
#Started timer at 2013-03-28 00:13:41 -0400...
#Time elapsed 23.472143 seconds

#----------------------------------------------

#Started timer at 2013-03-28 00:14:04 -0400...
#Time elapsed 30.57333 seconds
#Started timer at 2013-03-28 00:14:35 -0400...
#Time elapsed 41.034227 seconds

#==============================================
