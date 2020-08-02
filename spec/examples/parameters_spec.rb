RSpec.describe "parmeters examples" do
  describe "introduction" do
    subject { examples["parameters"]["introduction1"] }

    it_behaves_like "a liquid example"
  end

  describe "assign" do
    subject { examples["parameters"]["introduction2"] }

    it_behaves_like "a liquid example"
  end

  describe "arrays" do
    subject { examples["parameters"]["arrays"] }

    it_behaves_like "a liquid example"
  end

  describe "objects" do
    subject { examples["parameters"]["objects"] }

    it_behaves_like "a liquid example"
  end

  describe "precedence" do
    subject { examples["parameters"]["precedence"] }

    it_behaves_like "a liquid example"
  end

  private

  def pathname
    File.expand_path("#{__dir__}/../../_data/liquid.yml")
  end

  def examples
    @examples ||= YAML.load(File.read(pathname))
  end
end
