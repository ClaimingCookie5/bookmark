require 'pg'

class Bookmark

  def self.all
    if ENV['DB_ENV'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    results = connection.exec('SELECT * FROM bookmarks')
    results.map { |result| result['url'] }
  end
  


end
