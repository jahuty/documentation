require "spec_helper"

RSpec.describe "user views api keys" do
  before { visit "/components/api-keys.html" }

  scenario "with content" do
    expect(page).to have_content(/api key/i)
  end

  scenario "without erb tags" do
    expect(page).not_to have_content("<%=")
  end
end
