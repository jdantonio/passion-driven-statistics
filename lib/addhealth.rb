require 'ratistics'

module Addhealth
  extend self

  CSV_FILE = File.join(__dir__, '../data/addhealth_pds.csv')

  CSV_DEFINITION = [
    [:aid, :to_i],
    [:bio_sex, :to_i],
    [:h1gi20, :to_i],
    [:h1gi21, :to_i],
    [:h1rp1, :to_i],
    [:h1rp2, :to_i],
    [:h1rp3, :to_i],
    [:h1rp4, :to_i],
    [:h1rp5, :to_i],
    [:h1rp6, :to_i],
    [:h1pa1, :to_i],
    [:h1pa2, :to_i],
    [:h1pa3, :to_i],
    [:h1pa4, :to_i],
    [:h1pa5, :to_i],
    [:h1pa6, :to_i],
    [:h1pa7, :to_i],
    [:h1se1, :to_i],
    [:h1se2, :to_i],
    [:h1se3, :to_i],
    [:h1se4, :to_i],
    [:h1fs6, :to_i],
    [:h1fs11, :to_i],
    [:h1fs13, :to_i],
    [:h1fs19, :to_i],
    [:h1re1, :to_i],
    [:h1re2, :to_i],
    [:h1re3, :to_i],
    [:h1re4, :to_i],
    [:h1re5, :to_i],
    [:h1re6, :to_i],
    [:h1re7, :to_i],
    [:h1gi4, :to_i],
    [:h1gi6a, :to_i],
    [:h1gi6b, :to_i],
    [:h1gi6c, :to_i],
    [:h1gi6d, :to_i],
    [:h1rr1, :to_i],
    [:h1nr1, :to_i],
    [:h1nr2, :to_i],
    [:h1nr3, :to_i],
    [:h1nr5, :to_i],
    [:h1nr6, :to_i],
    [:h1jo10, :to_i],
    [:h1fp7, :to_i],
    [:h1fp8, :to_i],
    [:h1su1, :to_i],
    [:h1su2, :to_i]
  ]

  def load(opts={})
    puts 'Stand by. It will take 1-2 minutes to load all 6504 records...'
    Ratistics::Load.csv_file(CSV_FILE, CSV_DEFINITION, {:headers => true}.merge(opts)).freeze
  end

end
