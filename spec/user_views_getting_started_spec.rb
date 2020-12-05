require "spec_helper"

RSpec.describe "user views your account" do
  before { visit "/getting-started.html" }

  scenario "with content" do
    expect(page).to have_content(/account/i)
  end

  scenario "without erb tags" do
    expect(page).not_to have_content("<%=")
  end
end
