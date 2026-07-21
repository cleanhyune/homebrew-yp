class Yp < Formula
  include Language::Python::Virtualenv

  desc "Search YouTube and play audio-only from the terminal"
  homepage "https://github.com/cleanhyune/yp-player-in-cli"
  url "https://github.com/cleanhyune/yp-player-in-cli/archive/refs/tags/v0.3.4.tar.gz"
  sha256 "ad2f34b705136ae113296ab5f637a78141ca04fae95e161cd200db322cdbad5a"
  license "MIT"

  depends_on "mpv"
  depends_on "python@3.11"

  resource "yt-dlp" do
    url "https://files.pythonhosted.org/packages/f3/ee/188a3dadf9dfdac713243521f919feca1cd091d4358c9ea7e8ebb710a7cc/yt_dlp-2026.6.9-py3-none-any.whl"
    sha256 "442ba4c75724b9496144c8434b617962ee08d0ee7c26ec663848fe9b78d5a3e4"
  end

  resource "questionary" do
    url "https://files.pythonhosted.org/packages/3c/26/1062c7ec1b053db9e499b4d2d5bc231743201b74051c973dadeac80a8f43/questionary-2.1.1-py3-none-any.whl"
    sha256 "a51af13f345f1cdea62347589fbb6df3b290306ab8930713bfae4d475a7d4a59"
  end

  resource "prompt-toolkit" do
    url "https://files.pythonhosted.org/packages/84/03/0d3ce49e2505ae70cf43bc5bb3033955d2fc9f932163e84dc0779cc47f48/prompt_toolkit-3.0.52-py3-none-any.whl"
    sha256 "9aac639a3bbd33284347de5ad8d68ecc044b91a762dc39b7c21095fcd6a19955"
  end

  resource "wcwidth" do
    url "https://files.pythonhosted.org/packages/41/52/e465037f5375f43533d1a80b6923955201596a99142ed524d77b571a1418/wcwidth-0.7.0-py3-none-any.whl"
    sha256 "5d69154c429a82910e241c738cd0e2976fac8a2dd47a1a805f4afed1c0f136f2"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "검색어를 입력하세요", shell_output("#{bin}/yp 2>&1", 1)
  end
end
