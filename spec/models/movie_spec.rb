require 'rails_helper'

describe Movie do
  subject { build :movie, :title => 'Aladdin', :rating => 'G', :release_date => "2000-12-24" }
  
end
