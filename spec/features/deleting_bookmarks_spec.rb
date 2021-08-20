feature "Deleting bookmarks" do 
  scenario "User deletes a bookmark" do 
    visit "/bookmarks"
    find_button("Makers").click
    page.has_no_link?('Makers')
  end 
end 
