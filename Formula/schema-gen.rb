class SchemaGen < Formula
  desc "Automatically generate validation schemas from TypeScript class definitions"
  homepage "https://github.com/Naviary-Sanctuary/schema-gen"
  license "MIT"
  version "v0.1.0"

  on_macos do
    url "https://github.com/Naviary-Sanctuary/schema-gen/releases/download/v0.1.0/schema-gen-macos-arm64"
    sha256 "c627c0df124dc35aead6eb46b8070b872d0ab76e46b80487d2c8f310be5ab69b"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Naviary-Sanctuary/schema-gen/releases/download/v0.1.0/schema-gen-linux-x64"
      sha256 "5d06a21ca4705834416fb2977efd9c701953072d1d95c72f8f352fb45b0f8e2d"
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