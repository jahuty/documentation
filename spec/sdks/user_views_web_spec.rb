require "spec_helper"

RSpec.describe "user views web sdk" do
  before { visit "/sdks/web.html" }

  scenario "with content" do
    expect(page).to have_content(/web/i)
  end

  scenario "without erb tags" do
    expect(page).not_to have_content("<%=")
  end
end
