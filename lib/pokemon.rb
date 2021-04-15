class Pokemon

    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize(id: nil, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    
    def self.save(name, type, db)
          sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?, ?)
          SQL
          db.execute(sql, name, type)
    end 

    def self.find(id, db)
        row = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
        self.new(id: row[0], name: row[1], type: row[2], db: db)
    end
    
end
