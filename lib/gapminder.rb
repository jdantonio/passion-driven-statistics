require 'ratistics'

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
    puts 'Stand by. It will take 1-2 minutes to load all 289 records...'
    Ratistics::Load.csv_file(CSV_FILE, CSV_DEFINITION, :headers => true, :hamster => :vector).freeze
  end

end
