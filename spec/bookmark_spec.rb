require 'bookmark'

describe Bookmark do

  describe '.all' do

    it 'returns all bookmarks' do
      bookmarks = Bookmark.all
      expect(bookmarks).to include('https://www.mozilla.org/en-GB/')
      expect(bookmarks).to include('https://ruby-doc.org/')
      expect(bookmarks).to include('https://www.codewars.com/')
    end
    
  end

end