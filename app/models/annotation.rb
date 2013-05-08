class Annotation < ActiveRecord::Base
  attr_accessible :content, :source_id

  belongs_to :source

  validates :source, presence: true
  validates_presence_of :source_id, :content
end
