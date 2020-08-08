require "spec_helper"

RSpec.describe "user views organizations" do
  before { visit "/components/organizations.html" }

  scenario "with content" do
    expect(page).to have_content(/organizations/i)
  end

  scenario "without erb tags" do
    expect(page).not_to have_content("<%=")
  end
end
