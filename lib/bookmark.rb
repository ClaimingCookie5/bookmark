require 'pg'

class Bookmark

  def self.all
    connection = check_environment
    results = connection.exec('SELECT * FROM bookmarks')
    results.map { |result| result['url'] }
  end
  
  def self.create(url)
    connection = check_environment
    connection.exec("INSERT INTO bookmarks (url) VALUES ('#{url}')")
  end

  def self.check_environment
    if ENV['DB_ENV'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
  end
end
