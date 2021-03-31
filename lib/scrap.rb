class Scraper

RELATIVE_URL = "https://www.barnesandnoble.com/"

    def self.load_scraper
        html = open('https://www.barnesandnoble.com/b/books/_/N-1fZ29Z8q8')
        doc = Nokogiri::HTML(html)
        doc.css('.product-info-title').map do |books|
          name= books.css('a').text.upcase
          url = books.css('a').attr('href').value
          Books.new(name, url)
        end
    end

    def self.load_books_details(book)
        html = open(RELATIVE_URL+book.url)
        doc = Nokogiri::HTML(html)
        book.overview =doc.css('div[itemprop="description"]').text.strip
    end
   
end