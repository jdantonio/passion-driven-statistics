require 'iconv'

module Utilities
  extend self

  def read_as_utf8(path)
    ic = Iconv.new('UTF-8//IGNORE', 'UTF-8')
    data = File.open(path, 'rb').read
    return ic.iconv(data + ' ')[0..-2]
  end

  def with_timer
    start = Time.now
    puts "Started timer at #{start}..."
    retval = yield
    stop = Time.now
    puts "Time elapsed #{(stop - start)} seconds"
    return retval
  end

end
