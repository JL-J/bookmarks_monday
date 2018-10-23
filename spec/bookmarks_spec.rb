require 'bookmarks'

describe Bookmarks do
  describe '#.all' do
    it 'lists all the bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks VALUES(1, 'www.bbc.co.uk');")
      expect(Bookmarks.all).to include 'www.bbc.co.uk'
    end
  end
end
