RSpec.shared_examples "a valid example" do
  it "has valid input syntax" do
    expect(subject["input"]).to have_valid_syntax
  end

  it "has matching output" do
    expect(subject["input"]).to have_output(subject["output"], subject["data"])
  end
end

RSpec.shared_examples "a valid snippet" do
  it "has valid input syntax" do
    expect(subject).to have_valid_syntax
  end
end
