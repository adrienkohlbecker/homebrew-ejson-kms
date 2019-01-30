class EjsonKms < Formula
  desc "ejson-kms is a utility for managing a collection of secrets in source control using AWS KMS."
  homepage "https://github.com/adrienkohlbecker/ejson-kms"
  url "https://github.com/adrienkohlbecker/ejson-kms/releases/download/4.0.0/ejson-kms-4.0.0.tar.gz"
  version "4.0.0"
  sha256 "06486f2e7eb465346c1db2628e55f14cc262c5257a85994864e64a87210b5cd7"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    path = buildpath/"src/github.com/adrienkohlbecker/ejson-kms"
    path.install Dir["*"]
    cd path do
      system "env", "VERSION=4.0.0", "SHA1=def6aec1de9bb3ace51c8bef8a4dd06c34cf32b4", "OUTPUT=#{bin}/ejson-kms", "bin/compile"
      man.mkpath
      man1.install Dir["doc/man/*.1"]
    end
  end

  test do
    system "#{bin}/ejson-kms", "version"
  end
end
