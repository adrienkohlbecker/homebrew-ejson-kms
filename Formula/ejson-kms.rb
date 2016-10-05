class EjsonKms < Formula
  desc "ejson-kms is a utility for managing a collection of secrets in source control using AWS KMS."
  homepage "https://github.com/adrienkohlbecker/ejson-kms"
  url "https://github.com/adrienkohlbecker/ejson-kms/archive/1.0.1.tar.gz"
  version "1.0.1"
  sha256 "7e188d582abb02777732d5731518319d53606904b62e3452480346a4d9206e94"

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
