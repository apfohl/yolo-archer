module ApplicationHelper
  def tag_cloud(tags, classes)
    max = 0
    tags.each do |t|
      if t.count.to_i > max
        max = t.count.to_i
      end
    end
    tags.each do |tag|
      if tag.count.to_f > 1
        index = tag.count.to_f / max * (classes.size - 1)
        yield(tag, classes[index.round])
      end
    end
  end

  def markdown(text)
    options = {
      autolink: true,
      space_after_headers: true,
      no_intra_emphasis: true
    }
    Redcarpet::Markdown.new(Redcarpet::Render::HTML, options).render(text).html_safe
  end
end
