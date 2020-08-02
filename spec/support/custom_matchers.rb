require "liquid"

RSpec::Matchers.define :have_valid_syntax do |language: :liquid|
  match do |code|
    begin
      Liquid::Template.parse(code)
      return true
    rescue Liquid::SyntaxError
      return false
    end
  end
  failure_message do |actual|
    "expected that #{actual} would be valid #{language.to_s} syntax"
  end
end

RSpec::Matchers.define :have_output do |output, params|
  match do |input|
    begin
      template = Liquid::Template.parse(input)
      render   = template.render(params)

      return render == output
    rescue Liquid::SyntaxError => e
      return false
    end
  end
end
