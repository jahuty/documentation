require "spec_helper"

RSpec.describe "user views controls" do
  before { visit "/liquid/controls.html" }

  scenario "with content" do
    expect(page).to have_content(/control/i)
  end

  scenario "without erb tags" do
    expect(page).not_to have_content("<%=")
  end
end
