feature 'adding bookmark' do
  scenario 'add to bookmarks' do
    visit '/'
    fill_in 'url', with: 'www.iamawebsite.com'
    fill_in 'title', with: 'title'
    click_button 'Submit'
    click_button 'view all'
    expect(page).to have_content 'title'
  end
end
