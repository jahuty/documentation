require "spec_helper"

RSpec.describe "user reads variables" do
  before { visit "/liquid/variables.html" }

  scenario "with a happy face" do
    expect(page).to have_content(/variable/i)
  end
end
