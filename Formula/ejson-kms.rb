class EjsonKms < Formula
  desc "ejson-kms is a utility for managing a collection of secrets in source control using AWS KMS."
  homepage "https://github.com/adrienkohlbecker/ejson-kms"
  url "https://github.com/adrienkohlbecker/ejson-kms/releases/download/3.0.0/ejson-kms-3.0.0.tar.gz"
  version "3.0.0"
  sha256 "3688b502d7d74611a8de3ee1cac1979874a56453248e0a4164129abf29187905"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    path = buildpath/"src/github.com/adrienkohlbecker/ejson-kms"
    path.install Dir["*"]
    cd path do
      system "env", "VERSION=3.0.0", "SHA1=17e26365fe77a20237f8cf8bab13708e94229634", "OUTPUT=#{bin}/ejson-kms", "bin/compile"
      man.mkpath
      man1.install Dir["doc/man/*.1"]
    end
  end

  test do
    system "#{bin}/ejson-kms", "version"
  end
end
