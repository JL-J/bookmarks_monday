require 'bookmarks'

describe Bookmark do
  describe '#.all' do
    it 'lists all the bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (title, url) VALUES('title', 'www.bbc.co.uk');")
      bookmarks = Bookmark.all
      expect(bookmarks.first.title).to eq 'title'
    end
  end
end
