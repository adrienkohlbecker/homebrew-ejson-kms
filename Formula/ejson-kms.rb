class EjsonKms < Formula
  desc "ejson-kms is a utility for managing a collection of secrets in source control using AWS KMS."
  homepage "https://github.com/adrienkohlbecker/ejson-kms"
  url "https://github.com/adrienkohlbecker/ejson-kms/archive/2.0.0.tar.gz"
  version "2.0.0"
  sha256 "34ecbcc319a4d2e9f2ebcc178838ab2077f5d07e970939b71e940b2d1c8fb5ca"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    path = buildpath/"src/github.com/adrienkohlbecker/ejson-kms"
    path.install Dir["*"]
    cd path do
      system "env", "VERSION=2.0.0", "SHA1=21eaebcf0102be1a82589b5c53230f4de7a7f502", "OUTPUT=#{bin}/ejson-kms", "bin/compile"
      man.mkpath
      man1.install Dir["doc/man/*.1"]
    end
  end

  test do
    system "#{bin}/ejson-kms", "version"
  end
end
