class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :source
  # attr_accessible :title, :body
end
