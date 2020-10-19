require 'bundler'
Bundler.require

class Gossip
    attr_reader :author, :content, :id

    def initialize(author,content)
        @content = content
        @author = author
    end

    def save
        CSV.open("./db/gossip.csv", "ab") do |csv|
        csv << [self.author, self.content]
        end
    end

    def self.all
        all_gossips = []
        CSV.read("./db/gossip.csv").each do |csv_line|
          all_gossips << Gossip.new(csv_line[0], csv_line[1])
        end
        return all_gossips
    end

    def self.find(id)
        data_base = CSV.read("./db/gossip.csv")
        return data_base[id]
    end

    def update(author, content, id)
        list = CSV.read("./db/gossip.csv")
        list.each_with_index do |gossip, ind|
           if ind = id
            @author = author
            @content =content
           end
        end
        
    end
end