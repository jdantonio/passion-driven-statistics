require 'ratistics'

def timer
  beginning_time = Time.now
  puts "Started timer at #{beginning_time}..."
  retval = yield
  end_time = Time.now
  puts "Time elapsed #{(end_time - beginning_time)*1000} milliseconds"
  return retval
end

module Crater
  extend self

  CSV_FILE = File.join(__dir__, '../data/marscrater_pds.csv')

  CSV_DEFINITION = [
    :crater_id,
    [:latitude_circle_image, :to_f],
    [:longitude_circle_image, :to_f],
    [:diam_circle_image, :to_f],
    [:depth_rimfloor_topog, :to_f],
    :morphology_ejecta_1,
    :morphology_ejecta_2,
    :morphology_ejecta_3,
    [:number_layers, :to_i]
  ]

  def load
    Ratistics::Load.csv_file(CSV_FILE, CSV_DEFINITION, :headers => true).freeze
  end

end
