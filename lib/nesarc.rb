require 'ratistics'

module Nesarc
  extend self

  CSV_FILE = File.join(__dir__, '../data/nesarc_pds.csv')

  CSV_DEFINITION = [
    [:idnum, :to_i],
    [:age, :to_i],
    [:region, :to_i],
    [:doby, :to_i],
    [:sex, :to_i],
    [:marital, :to_i],
    [:s1q6a, :to_i],
    [:s1q7a1, :to_i],
    [:s1q239, :to_i],
    [:s1q2310, :to_i],
    [:s1q2311, :to_i],
    [:s1q2312, :to_i],
    [:s1q24ft, :to_i],
    [:s1q24in, :to_i],
    [:s1q24lb, :to_i],
    [:s2aq1, :to_i],
    [:s2aq2, :to_i],
    [:s2aq3, :to_i],
    [:s2aq8a, :to_i],
    [:s2aq8b, :to_i],
    [:s2aq8c, :to_i],
    [:s2cq1, :to_i],
    [:s2cq2a1, :to_i],
    [:s3aq1a, :to_i],
    [:check321, :to_i],
    [:s3aq3b1, :to_i],
    [:s3aq3c1, :to_i],
    [:s3bq1a1, :to_i],
    [:s3bq1a2, :to_i],
    [:s3bq1a3, :to_i],
    [:s3bq1a4, :to_i],
    [:s3bq1a5, :to_i],
    [:s3bq1a6, :to_i],
    [:s3bq1a7, :to_i],
    [:s3bq1a8, :to_i],
    [:s3bq1a9a, :to_i],
    [:majordeplife, :to_i],
    [:panlife, :to_i],
    [:gpanlife, :to_i],
    [:socpdlife, :to_i],
    [:genaxlife, :to_i],
    [:gambevdx, :to_i],
    [:alcabdep12dx, :to_i],
    [:alcabdepp12dx, :to_i],
    [:tab12mdx, :to_i],
    [:tabp12mdx, :to_i],
    [:tablifedx, :to_i],
    [:stim12abdep, :to_i],
    [:stimp12abdep, :to_i],
    [:pan12abdep, :to_i],
    [:panp12abdep, :to_i],
    [:sed12abdep, :to_i],
    [:sedp12abdep, :to_i],
    [:tran12abdep, :to_i],
    [:tranp12abdep, :to_i],
    [:coc12abdep, :to_i],
    [:cocp12abdep, :to_i],
    [:sol12abdep, :to_i],
    [:solp12abdep, :to_i],
    [:hal12abdep, :to_i],
    [:halp12abdep, :to_i],
    [:mar12abdep, :to_i],
    [:marp12abdep, :to_i],
    [:her12abdep, :to_i],
    [:herp12abdep, :to_i],
    [:othb12abdep, :to_i],
    [:othbp12abdep, :to_i],
    [:ethrace2a, :to_i]
  ]

  def load
    puts 'Stand by. It will take 2-3 minutes to load all 43,093 records...'
    Ratistics::Load.csv_file(CSV_FILE, CSV_DEFINITION, :headers => true, :hamster => :vector).freeze
  end

end
