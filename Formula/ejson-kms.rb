class EjsonKms < Formula
  desc "ejson-kms is a utility for managing a collection of secrets in source control using AWS KMS."
  homepage "https://github.com/adrienkohlbecker/ejson-kms"
  url "https://github.com/adrienkohlbecker/ejson-kms/releases/download/4.3.0/ejson-kms-4.3.0.tar.gz"
  version "4.3.0"
  sha256 "b7422dced1392e7262383c3da3750ad88f8b4a506e281c1a73b41ebf5b2463c9"

  depends_on "go" => :build

  def install
    system "env", "VERSION=4.3.0", "SHA1=b0478012f1345624ba91cfacef722e4d4bea3e56", "OUTPUT=#{bin}/ejson-kms", "bin/compile"
    man.mkpath
    man1.install Dir["doc/man/*.1"]
  end

  test do
    system "#{bin}/ejson-kms", "version"
  end
end
