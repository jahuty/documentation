require "spec_helper"

RSpec.describe "user reads variables" do
  it "passes" do
    expect(true).to be_truthy
  end

  scenario "passes too", js: true do
    expect(true).to be_truthy
  end
end
