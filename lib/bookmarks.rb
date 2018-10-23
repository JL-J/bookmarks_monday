class Bookmarks
  def self.create
    @bookmarks ||= Bookmarks.new
  end

  def self.instance
    @bookmarks
  end

  def add(url)
    conn = if ENV['ENVIRONMENT'] == 'test'
             PG.connect(dbname: 'bookmark_manager_test')
           else
             PG.connect(dbname: 'bookmark_manager')
           end

    conn.exec("INSERT INTO bookmarks (url) VALUES ('#{url}');")
  end

  def self.all
    conn = if ENV['ENVIRONMENT'] == 'test'
             PG.connect(dbname: 'bookmark_manager_test')
           else
             PG.connect(dbname: 'bookmark_manager')
           end

    rs = conn.exec('SELECT * FROM bookmarks;')
    rs.map do |row|
      row['url']
    end
  end
end
