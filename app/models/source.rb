class Source < ActiveRecord::Base
  attr_accessible :author, :publisher, :title, :url, :tag_list

  has_many :annotations, dependent: :destroy
  has_many :taggings
  has_many :tags, through: :taggings

  validates_presence_of :title
  
  include PgSearch
  pg_search_scope :search, against: [:author, :publisher, :title],
    associated_against: {annotations: :content},
    order_within_rank: "rating DESC"

  def self.text_search(query)
    if query.present?
      search(query)
    else
      scoped
    end
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).sources
  end

  def self.tag_counts
    Tag.select("tags.*, count(taggings.tag_id) as count").
      joins(:taggings).group("taggings.tag_id, tags.id, tags.name")
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
