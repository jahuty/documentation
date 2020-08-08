require "spec_helper"

RSpec.describe "user views liquid introduction" do
  before { visit "/liquid/introduction.html" }

  scenario "with content" do
    expect(page).to have_content(/template/i)
  end

  scenario "without erb tags" do
    expect(page).not_to have_content("<%=")
  end
end
