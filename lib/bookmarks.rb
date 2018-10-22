class Bookmarks

  def self.create
    @bookmarks = @bookmarks || Bookmarks.new
  end

  def self.instance
    @bookmarks
  end

  def self.all
    conn = PG.connect(dbname: 'bookmark_manager')
    rs = conn.exec("SELECT * FROM bookmarks;")
    rs.map do |row|
      row['url']
    end
  end

end
