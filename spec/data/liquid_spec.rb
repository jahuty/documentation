require "spec_helper"

RSpec.describe "liquid examples" do
  describe "controls" do
    let(:examples) { liquid_examples["controls"] }

    describe "introduction" do
      subject { examples["introduction"] }

      it_behaves_like "a liquid example"
    end

    describe "contains string" do
      subject { examples["contains_string"] }

      it_behaves_like "a liquid example"
    end

    describe "contains array" do
      subject { examples["contains_array"] }

      it_behaves_like "a liquid example"
    end

    describe "increment" do
      subject { examples["increment"] }

      it_behaves_like "a liquid example"
    end

    describe "increment" do
      subject { examples["increment_independence"] }

      it_behaves_like "a liquid example"
    end

    describe "decrement" do
      subject { examples["decrement"] }

      it_behaves_like "a liquid example"
    end

    describe "if" do
      subject { examples["if"] }

      it_behaves_like "a liquid example"
    end

    describe "unless" do
      subject { examples["unless"] }

      it_behaves_like "a liquid example"
    end

    describe "unless as if" do
      subject { examples["unless_as_if"] }

      it_behaves_like "a liquid example"
    end

    describe "else" do
      subject { examples["else"] }

      it_behaves_like "a liquid example"
    end

    describe "case" do
      subject { examples["case"] }

      it_behaves_like "a liquid example"
    end

    describe "raw" do
      subject { examples["raw"] }

      it_behaves_like "a liquid example"
    end

    describe "comment" do
      subject { examples["comment"] }

      it_behaves_like "a liquid example"
    end
  end

  describe "filters" do
    let(:examples) { liquid_examples["filters"] }

    describe "introduction" do
      subject { examples["introduction"] }

      it_behaves_like "a liquid example"
    end

    describe "left_to_right" do
      subject { examples["left_to_right"] }

      it_behaves_like "a liquid example"
    end
  end

  describe "parameters" do
    let(:examples) { liquid_examples["parameters"] }

    describe "introduction" do
      subject { examples["introduction1"] }

      it_behaves_like "a liquid example"
    end

    describe "assign" do
      subject { examples["introduction2"] }

      it_behaves_like "a liquid example"
    end

    describe "arrays" do
      subject { examples["arrays"] }

      it_behaves_like "a liquid example"
    end

    describe "objects" do
      subject { examples["objects"] }

      it_behaves_like "a liquid example"
    end

    describe "precedence" do
      subject { examples["precedence"] }

      it_behaves_like "a liquid example"
    end
  end

  describe "variables" do
    let(:examples) { liquid_examples["variables"] }

    describe "introduction" do
      subject { examples["introduction"] }

      it_behaves_like "a liquid example"
    end

    describe "assign" do
      subject { examples["assign"] }

      it_behaves_like "a liquid snippet"
    end

    describe "capture" do
      subject { examples["capture"] }

      it_behaves_like "a liquid snippet"
    end

    describe "strings" do
      subject { examples["strings"] }

      it_behaves_like "a liquid snippet"
    end

    describe "numbers" do
      subject { examples["numbers"] }

      it_behaves_like "a liquid snippet"
    end

    describe "booleans" do
      subject { examples["booleans"] }

      it_behaves_like "a liquid snippet"
    end

    describe "nil" do
      subject { examples["nil"] }

      it_behaves_like "a liquid example"
    end

    describe "arrays" do
      subject { examples["arrays"] }

      it_behaves_like "a liquid example"
    end
  end

  private

  def pathname
    File.expand_path("#{__dir__}/../../_data/liquid.yml")
  end

  def liquid_examples
    @examples ||= YAML.load(File.read(pathname))
  end
end
