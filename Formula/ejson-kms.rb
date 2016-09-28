class EjsonKms < Formula
  desc "ejson-kms is a utility for managing a collection of secrets in source control using AWS KMS."
  homepage "https://github.com/adrienkohlbecker/ejson-kms"
  url "https://github.com/adrienkohlbecker/ejson-kms/archive/1.0.0.tar.gz"
  version "1.0.0"
  sha256 "ad92b3260ff4a738389c56052f59f4e4a5b59232027d00002d35663e103ab0b3"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    path = buildpath/"src/github.com/adrienkohlbecker/ejson-kms"
    path.install Dir["*"]
    cd path do
      system "go", "build", "-o", bin / "ejson-kms"
      man.mkpath
      man1.install Dir['doc/man/*.1']
    end
  end

  test do
    system "#{bin}/ejson-kms", "version"
  end
end
