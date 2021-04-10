require "spec_helper"

RSpec.describe "user views api" do
  before { visit "/api.html" }

  scenario "with content" do
    expect(page).to have_content(/api/i)
  end

  scenario "with default language", js: true do
    expect(page).to have_toggled("bash")
    expect(page).not_to have_toggled("ruby")
  end

  scenario "and changes language from nav", js: true do
    click_language "ruby"

    expect(page).to have_toggled("ruby")
    expect(page).not_to have_toggled("bash")
  end

  scenario "and changes language from select", js: true do
    select_language "ruby"

    expect(page).to have_toggled("ruby")
    expect(page).not_to have_toggled("bash")
  end

  scenario "without erb tags" do
    expect(page).not_to have_content("<%=")
  end

  private

  def click_language(language)
    find(:css, "a[data-toggle-type=\"activity\"][data-toggle-language=\"#{language}\"]").click
  end

  def have_toggled(language)
    have_css "a[data-toggle-type=\"activity\"][data-toggle-language=\"#{language}\"].active"
    have_css "option[value=\"#{language}\"]:checked"
    have_css "[data-toggle-type=\"visibility\"][data-toggle-language=\"#{language}\"]"
  end

  def select_language(language)
    first("option[value=\"#{language}\"]").click
  end
end
