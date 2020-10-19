require 'bundler'
Bundler.require

class Gossip
    attr_reader :author, :content, :id, data_base 

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
        @data_base = CSV.read("./db/gossip.csv")
        return data_base[id]
    end

    def update(ind)

    end
end