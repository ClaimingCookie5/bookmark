require 'bookmark'

describe Bookmark do

  describe '.all' do

    it 'returns all bookmarks' do
      bookmarks = Bookmark.all
      expect(bookmarks[1].url).to eq('https://www.mozilla.org/en-GB/')
      expect(bookmarks[2].url).to eq('https://miniclip.com')
      expect(bookmarks[3].url).to eq('https://www.codewars.com/')
    end
    
  end

  describe '.create' do
    it 'stores a new bookmark to the database' do
      url = 'https://www.facebook.com/'
      title = 'Facebook'
      Bookmark.create(url: url, title: title)
      expect(Bookmark.all.last.url).to eq url
    end
  end

  describe '.delete' do
    it 'deletes a bookmark entry' do
      p "first: #{Bookmark.all}"
      bookmark = Bookmark.new(id: 0, url: 'http://www.makersacademy.com', title: 'Makers')
      p "hivwhdsuoijvs: #{bookmark}"
      p "hivwhdsuoijvs: #{bookmark.id}"
      p "first: #{Bookmark.all.length}"
      expect{ Bookmark.delete(id: 0) }.to change{ Bookmark.all.length }.by (-1)
    end
  end

end