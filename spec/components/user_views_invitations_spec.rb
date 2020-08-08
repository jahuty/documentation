require "spec_helper"

RSpec.describe "user views invitations" do
  before { visit "/components/invitations.html" }

  scenario "with content" do
    expect(page).to have_content(/invitation/i)
  end

  scenario "without erb tags" do
    expect(page).not_to have_content("<%=")
  end
end
