class SchemaGen < Formula
  desc "Automatically generate validation schemas from TypeScript class definitions"
  homepage "https://github.com/Naviary-Sanctuary/schema-gen"
  license "MIT"
  version "0.2.4"

  on_macos do
    url "https://github.com/Naviary-Sanctuary/schema-gen/releases/download/v0.2.4/schema-gen-macos-arm64"
    sha256 "a74665c461d42eb45ae25447137911f90de75cba881670084cfb224294757250"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Naviary-Sanctuary/schema-gen/releases/download/v0.2.4/schema-gen-linux-x64"
      sha256 "fba99083ea189920e04674a0404aab4049935c1cc9cd5612b96359d19fa4cce7"
    end
  end

  def install
    if OS.mac?
      bin.install "schema-gen-macos-arm64" => "schema-gen"
    elsif OS.linux?
      bin.install "schema-gen-linux-x64" => "schema-gen"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/schema-gen --version")
  end
end