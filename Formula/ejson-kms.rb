class EjsonKms < Formula
  desc "ejson-kms is a utility for managing a collection of secrets in source control using AWS KMS."
  homepage "https://github.com/adrienkohlbecker/ejson-kms"
  url "https://github.com/adrienkohlbecker/ejson-kms/releases/download/4.1.0/ejson-kms-4.1.0.tar.gz"
  version "4.1.0"
  sha256 "011527d1c5e4e2a91d04eb86372dc426e7936eb5afee996fe11e5dd73011e4f8"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    path = buildpath/"src/github.com/adrienkohlbecker/ejson-kms"
    path.install Dir["*"]
    cd path do
      system "env", "VERSION=4.1.0", "SHA1=ec9a2a79d2a7ab459f7f20b4b7a00baa208a9128", "OUTPUT=#{bin}/ejson-kms", "bin/compile"
      man.mkpath
      man1.install Dir["doc/man/*.1"]
    end
  end

  test do
    system "#{bin}/ejson-kms", "version"
  end
end
