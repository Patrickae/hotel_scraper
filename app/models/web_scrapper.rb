require 'kimurai'
class WebScrapper < Kimurai::Base
  @name = "spider"
  @engine = :selenium_chrome
  @start_urls = ["https://reservations.ayreshotels.com/95047?adults=2&children=0&datein=7/22/2022&identifier=&languageid=1&length=4&portal=fre&rateplanid=&rooms=1&utmstring=#/accommodation/room"]
  @config = {
    user_agent: "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36",
    before_request: { delay: 4..7 }
  }

  def parse(response, url:, data: {})
    response.xpath("//div[@class='CardList-price-title']").each do |price|
      puts price.text
    end

    # if next_page = response.at_xpath("//a[@class='next_page']")
    #   request_to :parse, url: absolute_url(next_page[:href], base: url)
    # end
  end
end
