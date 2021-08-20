require 'pg'

class Bookmark

  def self.check_environment
    if ENV['DB_ENV'] == 'test'
      connection = which_db('bookmark_manager_test')
    else
      connection = which_db('bookmark_manager')
    end
  end

  def self.which_db(database)
    PG.connect(dbname: "#{database}")
  end

  def self.all
    connection = check_environment
    results = connection.exec('SELECT * FROM bookmarks')
    results.map { |result| result['url'] }
  end
  
  def self.create(url)
    connection = check_environment
    connection.exec("INSERT INTO bookmarks (url) VALUES ('#{url}')")
  end

end
