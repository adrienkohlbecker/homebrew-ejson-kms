class EjsonKms < Formula
  desc "ejson-kms is a utility for managing a collection of secrets in source control using AWS KMS."
  homepage "https://github.com/adrienkohlbecker/ejson-kms"
  url "https://github.com/adrienkohlbecker/ejson-kms/archive/1.0.0-rc1.tar.gz"
  version "1.0.0-rc1"
  sha256 "ba03547ab6a6c1bcc0f880f3049274deda71e93053fee91ee308f846632a1e92"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    path = buildpath/"src/github.com/adrienkohlbecker/ejson-kms"
    path.install Dir["*"]
    cd path do
      system "go", "build", "-o", bin / "ejson-kms"
    end
  end

  test do
    system "#{bin}/ejson-kms", "version"
  end
end
