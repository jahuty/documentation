require "spec_helper"

RSpec.describe "user views your application" do
  before { visit "/getting-started/your-application.html" }

  scenario "with content" do
    expect(page).to have_content(/application/i)
  end

  scenario "without erb tags" do
    expect(page).not_to have_content("<%=")
  end
end
