require "spec_helper"

RSpec.describe "user reads variables" do
  before { visit "/liquid/parameters.html" }

  scenario "with content" do
    expect(page).to have_content(/parameter/i)
  end

  scenario "without erb tags" do
    expect(page).not_to have_content("<%=")
  end
end
