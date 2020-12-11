require "spec_helper"

RSpec.describe "user views php sdk" do
  before { visit "/sdks/php.html" }

  scenario "with content" do
    expect(page).to have_content(/php/i)
  end

  scenario "without erb tags" do
    expect(page).not_to have_content("<%=")
  end
end
