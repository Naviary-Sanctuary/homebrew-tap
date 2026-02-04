class SchemaGen < Formula
  desc "Automatically generate validation schemas from TypeScript class definitions"
  homepage "https://github.com/Naviary-Sanctuary/schema-gen"
  license "MIT"
  version "0.2.3"

  on_macos do
    url "https://github.com/Naviary-Sanctuary/schema-gen/releases/download/v0.2.3/schema-gen-macos-arm64"
    sha256 "3e0fcd7d5a1da34ba6ceb85774465876d40d470782ba50f8ad1a816b4982a94d"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Naviary-Sanctuary/schema-gen/releases/download/v0.2.3/schema-gen-linux-x64"
      sha256 "6adcca90664df21f4c61ba75ae71b44824cf5809eeafc642dd12da03f467472f"
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