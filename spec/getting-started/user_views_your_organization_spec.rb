require "spec_helper"

RSpec.describe "user views your organization" do
  before { visit "/getting-started/your-organization.html" }

  scenario "with content" do
    expect(page).to have_content(/organization/i)
  end

  scenario "without erb tags" do
    expect(page).not_to have_content("<%=")
  end
end
