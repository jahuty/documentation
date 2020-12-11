require "spec_helper"

RSpec.describe "user views sdks" do
  before { visit "/sdks/overview.html" }

  scenario "with content" do
    expect(page).to have_content(/sdk/i)
  end

  scenario "without erb tags" do
    expect(page).not_to have_content("<%=")
  end
end
