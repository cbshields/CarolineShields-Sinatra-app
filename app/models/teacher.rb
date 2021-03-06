class Teacher < ActiveRecord::Base
  has_many :courses
  has_secure_password

  def slug
    self.username.gsub(" ","-").downcase
  end

  def self.find_by_slug(slug)
    self.all.find{|x| x.slug == slug}
  end

end
