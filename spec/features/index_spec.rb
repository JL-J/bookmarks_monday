feature "index" do
  scenario "list all the bookmarks" do
    visit '/'
    click_button 'view all'
    expect(page).to have_content "http://bbc.co.uk"
  end
end
