feature 'adding bookmark' do
  scenario 'add to bookmarks' do
    visit '/'
    fill_in 'url', with: 'www.iamawebsite.com'
    click_button 'Submit'
    click_button 'view all'
    expect(page).to have_content 'www.iamawebsite.com'
  end
end
