require 'pg'

def setup_test_database
  
  p "Setting up test database..."

  connection = PG.connect(dbname: 'bookmark_manager_test')

  # Clear the boomarks table
  connection.exec("TRUNCATE bookmarks;")
end

def populate_table
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
  connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.mozilla.org/en-GB/');")
  connection.exec("INSERT INTO bookmarks (url) VALUES ('https://miniclip.com');")
  connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.codewars.com/');")
end
