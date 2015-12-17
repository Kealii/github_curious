class Contribution
  require 'nokogiri'
  require 'open-uri'


  def initialize(login = nil)
    @url = "https://github.com/#{login}"
  end

  def commits
    if Rails.env.test?
      5
    else
      Nokogiri::HTML(open(@url)).at_css(".contrib-number").text.gsub("total","").rstrip.gsub(",","").to_i
    end
  end

  def longest_streak
    if Rails.env.test?
      5
    else
      Nokogiri::HTML(open(@url)).css(".contrib-column").css(".table-column").css(".contrib-number")[1].text.strip.gsub("days","").rstrip
    end
  end

  def current_streak
    if Rails.env.test?
      5
    else
      Nokogiri::HTML(open(@url)).css(".contrib-column").css(".table-column").css(".contrib-number")[2].text.strip.gsub("days","").rstrip
    end
  end
end
