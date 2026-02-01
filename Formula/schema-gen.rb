class SchemaGen < Formula
  desc "Automatically generate validation schemas from TypeScript class definitions"
  homepage "https://github.com/Naviary-Sanctuary/schema-gen"
  version "0.1.0"
  license "MIT"

  on_macos do
    url "https://github.com/Naviary-Sanctuary/schema-gen/releases/download/v0.1.0/schema-gen-macos-arm64"
    sha256 "PLACEHOLDER_ARM64_SHA256"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Naviary-Sanctuary/schema-gen/releases/download/v0.1.0/schema-gen-linux-x64"
      sha256 "PLACEHOLDER_LINUX_SHA256"
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