feature "Prints saved bookmarks" do 
  scenario "Outputs list of bookmarks" do 
    visit "/bookmarks"
    find_link('Makers').visible?
  end 
end 