class Bookmark

  attr_reader :id, :title, :url

  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url
  end

  def self.add(title, url)
    conn = if ENV['ENVIRONMENT'] == 'test'
             PG.connect(dbname: 'bookmark_manager_test')
           else
             PG.connect(dbname: 'bookmark_manager')
           end

    conn.exec("INSERT INTO bookmarks (title, url) VALUES ('#{title}','#{url}');")
  end

  def self.all
    conn = if ENV['ENVIRONMENT'] == 'test'
             PG.connect(dbname: 'bookmark_manager_test')
           else
             PG.connect(dbname: 'bookmark_manager')
           end

    rs = conn.exec('SELECT * FROM bookmarks;')
    rs.map do |row|
      Bookmark.new(row['id'], row['title'], row['url'])
    end
  end
end
