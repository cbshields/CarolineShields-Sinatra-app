class Course < ActiveRecord::Base
  belongs_to :teacher

  def slug
    self.title.gsub(" ","-").downcase
  end

  def self.find_by_slug(slug)
    self.all.find{|x| x.slug == slug}
  end

end
