require_relative 'lib/utilities'
require_relative 'lib/crater'

require 'ruby-prof'

#result = RubyProf.profile do
  craters = Utilities.with_timer{Crater.load2}
  #craters = Utilities.with_timer{Crater.load3}
#end

#printer = RubyProf::FlatPrinter.new(result)
#printer.print(STDOUT)
