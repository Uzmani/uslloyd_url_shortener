class Url < ActiveRecord::Base
  validates :short_url, uniqueness: true
  validates :long_url, format: { with: /http.?:\/\/.*/,
    message: "only URLs starting with http:// or https://" }
  validates :long_url, presence: true
  before_save :generate_short_url

  def generate_short_url
    until false
      # range = [*'0'..'9', *'a'..'z', *'A'..'Z']
      # short = Array.new(6){range.sample}.join
      short = "123"
      self.short_url = short
      if self.invalid?
      else 
        break  
      end
    end



  end
end
