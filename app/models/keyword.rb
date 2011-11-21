class Keyword < ActiveRecord::Base
  belongs_to :brand

  validates :value, :presence => { :message => 'Keywords need values' }
end
