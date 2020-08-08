require "spec_helper"

RSpec.describe "user views api" do
  before { visit "/api.html" }

  scenario "with content" do
    expect(page).to have_content(/api/i)
  end

  scenario "without erb tags" do
    expect(page).not_to have_content("<%=")
  end
end
