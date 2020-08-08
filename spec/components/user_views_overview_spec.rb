require "spec_helper"

RSpec.describe "user views overview" do
  before { visit "/components/overview.html" }

  scenario "with content" do
    expect(page).to have_content(/components/i)
  end

  scenario "without erb tags" do
    expect(page).not_to have_content("<%=")
  end
end
