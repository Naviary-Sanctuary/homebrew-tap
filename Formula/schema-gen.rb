class SchemaGen < Formula
  desc "Automatically generate validation schemas from TypeScript class definitions"
  homepage "https://github.com/Naviary-Sanctuary/schema-gen"
  license "MIT"
  version "v0.1.1"

  on_macos do
    url "https://github.com/Naviary-Sanctuary/schema-gen/releases/download/v0.1.1/schema-gen-macos-arm64"
    sha256 "cfda0bbeb271ead4d52ccd3d6decefc134afc07112f625679c9674fa76867a46"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Naviary-Sanctuary/schema-gen/releases/download/v0.1.1/schema-gen-linux-x64"
      sha256 "a9cad7d1eb67e4885f38e3e25b02defbaf358cc56da8a91fa7b06c59596632dc"
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