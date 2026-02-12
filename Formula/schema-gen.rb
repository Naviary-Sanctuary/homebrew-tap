class SchemaGen < Formula
  desc "Automatically generate validation schemas from TypeScript class definitions"
  homepage "https://github.com/Naviary-Sanctuary/schema-gen"
  license "MIT"
  version "0.3.0"

  on_macos do
    url "https://github.com/Naviary-Sanctuary/schema-gen/releases/download/v0.3.0/schema-gen-macos-arm64"
    sha256 "4fc673861e8ab8c55fa91e8bfe96954e6512bd10edd3a7871479f1bf8f28b8c5"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Naviary-Sanctuary/schema-gen/releases/download/v0.3.0/schema-gen-linux-x64"
      sha256 "f9fbab8f48deda860cb6d6075d143587677cfaabd85a1a059f20a0cc34078772"
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