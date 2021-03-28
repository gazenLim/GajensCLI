class Books

    attr_accessor :name, :url, :overview
    @@all=[]
    
    def initialize(name, url)
        @name = name
        @url = url
        @@all << self

    end

    def self.all
        @@all
    end

end