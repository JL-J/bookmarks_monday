require 'bookmarks'

describe Bookmarks do

  describe '#.all' do
    it 'lists all the bookmarks' do
      expect(Bookmarks.all).to include "http://bbc.co.uk"
    end
  end

end
