require "spec_helper"

RSpec.describe "user views ruby sdk" do
  before { visit "/sdks/ruby.html" }

  scenario "with content" do
    expect(page).to have_content(/ruby/i)
  end
end
