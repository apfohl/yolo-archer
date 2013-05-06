class Annotation < ActiveRecord::Base
  attr_accessible :content, :rating

  belongs_to :source
end
