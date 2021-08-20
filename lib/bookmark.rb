require 'pg'

class Bookmark
  attr_reader :id, :url, :title

  def initialize(id:, url:, title:)
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
    results = connection.exec('SELECT * FROM bookmarks;')
    results.map { |result| Bookmark.new(id: result['id'], title: result['title'], url: result['url'])}
  end
  
  def self.create(url:, title:)
    connection = check_environment
    result = connection.exec_params("INSERT INTO bookmarks (url, title) VALUES ($1, $2) RETURNING id, url, title;", [url, title])
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(id:)
    connection = check_environment
    connection.exec_params("DELETE FROM bookmarks WHERE id = $1;", [id])
  end
end
