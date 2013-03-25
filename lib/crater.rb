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
    puts 'Stand by. It will take 5-6 minutes to load all 384,343 records...'
    Ratistics::Load.csv_file(CSV_FILE, CSV_DEFINITION, {:headers => true}.merge(opts)).freeze
  end

  def get
    data = []
    regex = /("[^"]*",)|("[^"]*"$)|([^,]*,)|([^,]+$)/
    File.open(CSV_FILE, 'r').each_line do |row|
      row = row.strip.scan(regex).collect do |match|
        match.select{|m| ! m.nil? }.first.chomp(',').gsub(/"/, '')
      end
      # doubles processing time from 15-30 seconds
      #(0..[CSV_DEFINITION.length, row.length].min-1).each do |i|
        #if CSV_DEFINITION[i].is_a?(Array) && CSV_DEFINITION[i].last.is_a?(Symbol)
          #row[i] = row[i].send(CSV_DEFINITION[i].last)
        #elsif CSV_DEFINITION[i].is_a?(Array) && CSV_DEFINITION[i].last.is_a?(Proc)
          #row[i] = CSV_DEFINITION[i].last.call(row[i])
        #end
      #end
      data << row
    end
    return data
  end

end
