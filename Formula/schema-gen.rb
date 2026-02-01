class SchemaGen < Formula
  desc "Automatically generate validation schemas from TypeScript class definitions"
  homepage "https://github.com/Naviary-Sanctuary/schema-gen"
  license "MIT"
  version "v0.1.2"

  on_macos do
    url "https://github.com/Naviary-Sanctuary/schema-gen/releases/download/v0.1.2/schema-gen-macos-arm64"
    sha256 "a8e8824ffb4c35cc09916abeb7d9dd3840ca2da074a4253935eda15c6b6ada9e"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Naviary-Sanctuary/schema-gen/releases/download/v0.1.2/schema-gen-linux-x64"
      sha256 "4fb9e9c3fcac266e929756b7821d7ebff68bf04bd20e5d21c1d3513018f10439"
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