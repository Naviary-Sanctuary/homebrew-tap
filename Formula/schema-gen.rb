class SchemaGen < Formula
  desc "Automatically generate validation schemas from TypeScript class definitions"
  homepage "https://github.com/Naviary-Sanctuary/schema-gen"
  license "MIT"
  version "0.2.1"

  on_macos do
    url "https://github.com/Naviary-Sanctuary/schema-gen/releases/download/v0.2.1/schema-gen-macos-arm64"
    sha256 "165957ac52000f7be97c0d744076aeb2c236818565483352b990185614319cc1"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Naviary-Sanctuary/schema-gen/releases/download/v0.2.1/schema-gen-linux-x64"
      sha256 "5b36db01ac6a20ab4b3fa2b645439d1f967d7e9bfc2e3edd3e98b19fcca761fc"
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