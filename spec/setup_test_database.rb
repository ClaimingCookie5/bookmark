require 'pg'

def setup_test_database
  
  p "Setting up test database..."

  connection = PG.connect(dbname: 'bookmark_manager_test')

  # Clear the boomarks table
  connection.exec("TRUNCATE bookmarks;")
end

def populate_table
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Makers');")
  connection.exec("INSERT INTO bookmarks (url, title) VALUES ('https://www.mozilla.org/en-GB/', 'Mozilla');")
  connection.exec("INSERT INTO bookmarks (url, title) VALUES ('https://miniclip.com', 'Miniclip');")
  connection.exec("INSERT INTO bookmarks (url, title) VALUES ('https://www.codewars.com/', 'Codewars');")
end
