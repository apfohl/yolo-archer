class Source < ActiveRecord::Base
  attr_accessible :author, :publisher, :rating, :title, :url

  has_many :annotations
end
