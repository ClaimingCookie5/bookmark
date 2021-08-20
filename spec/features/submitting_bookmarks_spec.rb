feature 'can submit bookmarks to be saved' do
  scenario 'checking that there is a form for submitting bookamrks' do
    visit('/submit_bookmark')
    find_field('url').value
  end
end