require "spec_helper"

RSpec.describe "user views index" do
  before { visit "/" }

  scenario "with content" do
    expect(page).to have_content(/jahuty/i)
  end

  scenario "without erb tags" do
    expect(page).not_to have_content("<%=")
  end
end
