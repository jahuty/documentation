require "spec_helper"

RSpec.describe "user views node sdk" do
  before { visit "/sdks/node.html" }

  scenario "with content" do
    expect(page).to have_content(/node.js/i)
  end

  scenario "without erb tags" do
    expect(page).not_to have_content("<%=")
  end
end
