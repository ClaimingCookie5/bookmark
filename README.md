# Bookmark Challenge
---------------------
Task
-------

```
As a User
So I know what I have bookmarked
I need to to print a list of bookmarks

As a User
So that I can save a website
I would like to add the site's address and title to the bookmark manager

```

Domain Model diagram
----------------------
https://miro.com/app/board/o9J_l2U-ZSE=/

## Setting up a Database

* 1 - First enter ```psql postgres```
* 2 - Create a Database by entering ```CREATE DATABASE < database_name >;```
* 3 - Connect to your brand new Database with ```\c < database_name >;```
* 4 - Next we need to create a table to store information, this would look like the following
```
CREATE [TEMP] TABLE [IF NOT EXISTS] < table_name >(
  pk SERIAL PRIMARY KEY,
  c1 type(size) NOT NULL,
  c2 type(size) NULL,
   ...
);
```
Both ```[TEMP]``` and ```[IF NOT EXISTS]``` do not have be used to create a new table.

### How to Create a row entry in your table
```
INSERT INTO <table_name> (url) VALUES (<'link url in speechmarks'>);
```
### How to List the your new entry using a SELECT statement
```
SELECT * FROM <table_name>;
```
If you want to select just a single column, enter the following
```
SELECT < column_name >
FROM < table_name >;
```

### How to Delete a row using a DELETE statement
```
DELETE FROM <table_name>
WHERE url = 'http://www.askjeeves.com';
```
or
```
DELETE FROM <table_name>
WHERE id = <id_number>;
```

### How to Update a row using an UPDATE statement
```
UPDATE <table_name>
SET url = <'link url in speechmarks'> 
WHERE url = <'link url in speechmarks'>;
```
or
```
UPDATE <table_name>
SET url = <'link url in speechmarks'> 
WHERE id = <id_number>;
```
### Testing using a 'Test Database'
Create a new ruby file, and define this method within.
```
def setup_test_database
  
  p "Setting up test database..."

  connection = PG.connect(dbname: 'bookmark_manager_test')

  # Clear the boomarks table
  connection.exec("TRUNCATE bookmarks;")
end
```
Require your new your file at the top like ```require "< name_of_ruby_file >"```
and write the following into the top of your spec file ```ENV['DB_ENV'] = 'test'``` along with
```
RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
    populate_table
  end
end
```
Next you'll need to change the way your Ruby class works based on whether it's testing or not.
To do this, change the Bookmark.all method to include the __strong__environment variable__strong__.
```
if ENV['DB_ENV'] == 'test'
  connection = PG.connect(dbname: 'bookmark_manager_test')
else
  connection = PG.connect(dbname: 'bookmark_manager')
end
```
