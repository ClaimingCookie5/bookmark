feature "Prints saved bookmarks" do 
  scenario "Outputs list of bookmarks" do 
    visit "/bookmarks"
    find_link('http://www.makersacademy.com').visible?
  end 
end 