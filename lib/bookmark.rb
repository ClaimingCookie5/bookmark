require 'pg'

class Bookmark

  def self.all
    connection = PG.connect(dbname: 'bookmark_manager')
    results = connection.exec('SELECT * FROM bookmarks')
    results.map { |result| result['url'] }
  end
  
end
