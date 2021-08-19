feature "Prints saved bookmarks" do 
  scenario "Outputs list of bookmarks" do 
    visit "/bookmarks"
    page.has_link? ('https://ruby-doc.org/')
    page.has_link? ('https://www.codewars.com/')
    page.has_link? ('https://www.mozilla.org/en-GB/')
  end 
end 