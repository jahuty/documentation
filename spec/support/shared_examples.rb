RSpec.shared_examples "a liquid example" do
  it "has valid liquid syntax" do
    expect {
      Liquid::Template.parse(subject["input"])
    }.not_to raise_error
  end

  it "has correct output" do
    template = Liquid::Template.parse(subject["input"])
    render   = template.render(subject.fetch("data", {}))
    output   = subject["output"]

    expect(render).to eq(output)
  end
end

RSpec.shared_examples "a liquid snippet" do
  it "has valid input syntax" do
    expect {
      Liquid::Template.parse(subject["input"])
    }.not_to raise_error
  end
end
