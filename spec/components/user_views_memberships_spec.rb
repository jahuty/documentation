require "spec_helper"

RSpec.describe "user views memberships" do
  before { visit "/components/memberships.html" }

  scenario "with content" do
    expect(page).to have_content(/memberships/i)
  end

  scenario "without erb tags" do
    expect(page).not_to have_content("<%=")
  end
end
