require 'bookmark'

describe Bookmark do

  describe '.all' do

    it 'returns all bookmarks' do
      bookmarks = Bookmark.all
      expect(bookmarks).to include('https://www.mozilla.org/en-GB/')
      expect(bookmarks).to include('https://miniclip.com')
      expect(bookmarks).to include('https://www.codewars.com/')
    end
    
  end

  describe '.create' do
    it 'stores a new bookmark to the database' do
      url = 'https://www.facebook.com/'
      Bookmark.create(url)
      expect(Bookmark.all).to include(url)
    end
  end

end