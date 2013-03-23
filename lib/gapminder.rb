require 'ratistics'
require 'iconv'

module Gapminder
  extend self

  CSV_FILE = File.join(__dir__, '../data/gapminder_pds.csv')

  CSV_DEFINITION = [
    :country,
    [:incomeperperson, :to_f],
    [:alcconsumption, :to_f],
    [:armedforcesrate, :to_f],
    [:breastcancerper100th, :to_f],
    [:co2emissions, :to_f],
    [:femaleemployrate, :to_f],
    [:hivrate, :to_f],
    [:internetuserate, :to_f],
    [:lifeexpectancy, :to_f],
    [:oilperperson, :to_f],
    [:polityscore, :to_f],
    [:relectricperperson, :to_f],
    [:suicideper100th, :to_f],
    [:employrate, :to_f],
    [:urbanrate, :to_f]
  ]

  def load
    ic = Iconv.new('UTF-8//IGNORE', 'UTF-8')
    data = File.open(CSV_FILE, 'rb').read
    data = ic.iconv(data + ' ')[0..-2]
    Ratistics::Load.csv_data(data, CSV_DEFINITION, :headers => true).freeze
  end

end
