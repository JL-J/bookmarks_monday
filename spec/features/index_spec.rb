feature 'index' do
  scenario 'list all the bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (title, url) VALUES('test-title', 'www.bbc.co.uk');")
    visit '/'
    click_button 'view all'
    expect(page).to have_content 'test-title'
  end
end
