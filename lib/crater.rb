require 'ratistics'
require 'hamster'

module Crater
  extend self

  CSV_FILE = File.join(__dir__, '../data/marscrater_pds.csv')

  CSV_DEFINITION = [
    :crater_id,
    :crater_name,
    [:latitude_circle_image, :to_f],
    [:longitude_circle_image, :to_f],
    [:diam_circle_image, :to_f],
    [:depth_rimfloor_topog, :to_f],
    [:morphology_ejecta_1, lambda{|item| item.split('/')}],
    [:morphology_ejecta_2, lambda{|item| item.split('/')}],
    [:morphology_ejecta_3, lambda{|item| item.split('/')}],
    [:number_layers, :to_i]
  ]

  def load(opts={})
    puts 'Stand by. It will take 1-2 minutes to load all 384,343 records...'
    Ratistics::Load::Csv.file(CSV_FILE, {:def => CSV_DEFINITION, :headers => true}.merge(opts)).freeze
  end

end
