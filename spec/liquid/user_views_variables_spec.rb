require "spec_helper"

RSpec.describe "user views variables" do
  before { visit "/liquid/variables.html" }

  scenario "with content" do
    expect(page).to have_content(/variable/i)
  end

  scenario "without erb tags" do
    expect(page).not_to have_content("<%=")
  end
end
