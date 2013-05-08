class Source < ActiveRecord::Base
  attr_accessible :author, :publisher, :title, :url

  has_many :annotations, dependent: :destroy

  validates_presence_of :title
end
