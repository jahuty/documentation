require "spec_helper"

RSpec.describe "user views filters" do
  before { visit "/liquid/filters.html" }

  scenario "with content" do
    expect(page).to have_content(/filters/i)
  end

  scenario "without erb tags" do
    expect(page).not_to have_content("<%=")
  end
end
