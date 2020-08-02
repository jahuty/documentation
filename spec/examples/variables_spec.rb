RSpec.describe "variables examples" do
  describe "introduction" do
    subject { examples["variables"]["introduction"] }

    it_behaves_like "a liquid example"
  end

  describe "assign" do
    subject { examples["variables"]["assign"] }

    it_behaves_like "a liquid snippet"
  end

  describe "capture" do
    subject { examples["variables"]["capture"] }

    it_behaves_like "a liquid snippet"
  end

  describe "strings" do
    subject { examples["variables"]["strings"] }

    it_behaves_like "a liquid snippet"
  end

  describe "numbers" do
    subject { examples["variables"]["numbers"] }

    it_behaves_like "a liquid snippet"
  end

  describe "booleans" do
    subject { examples["variables"]["booleans"] }

    it_behaves_like "a liquid snippet"
  end

  describe "nil" do
    subject { examples["variables"]["nil"] }

    it_behaves_like "a liquid example"
  end

  describe "arrays" do
    subject { examples["variables"]["arrays"] }

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
