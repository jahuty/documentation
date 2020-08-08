require "spec_helper"

RSpec.describe "user views your snippet" do
  before { visit "/getting-started/your-snippet.html" }

  scenario "with content" do
    expect(page).to have_content(/snippet/i)
  end

  scenario "without erb tags" do
    expect(page).not_to have_content("<%=")
  end
end
