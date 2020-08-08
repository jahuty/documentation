require "spec_helper"

RSpec.describe "user views liquid loops" do
  before { visit "/liquid/loops.html" }

  scenario "with content" do
    expect(page).to have_content(/loop/i)
  end

  scenario "without erb tags" do
    expect(page).not_to have_content("<%=")
  end
end
