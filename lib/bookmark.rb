require 'pg'

class Bookmark
  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

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
    results.map { |result| Bookmark.new(result['id'], result['url'], result['title']) }
  end
  
  def self.create(url, title)
    connection = check_environment
    connection.exec_params("INSERT INTO bookmarks (url, title) VALUES ($1, $2)", [url, title])
  end
end
