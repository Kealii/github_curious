class Contribution
  require 'nokogiri'
  require 'open-uri'

  def initialize(login)
    @url = "https://github.com/#{login}"
  end

  def commits
    Nokogiri::HTML(open(@url)).at_css(".contrib-number").text.gsub("total","").rstrip.gsub(",","").to_i
  end
end
