class Canhazgpu < Formula
  desc "GPU reservation tool for shared development systems"
  homepage "https://github.com/russellb/canhazgpu"
  url "https://github.com/russellb/canhazgpu/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "c4bfa5c463a46b74fdc1afaacabbe3395dab50512ff3a7154c5b42be86d264a3"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
    bin.install_symlink "canhazgpu" => "chg"
    bash_completion.install "autocomplete_canhazgpu.sh" => "canhazgpu"
  end

  test do
    assert_match "GPU reservation tool", shell_output("#{bin}/canhazgpu --help")
  end
end
