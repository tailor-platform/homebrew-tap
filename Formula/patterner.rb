class Patterner < Formula
  desc 'patterner is a tool to analyze and present best practices (patterns) for Tailor Platform applications.'
  version '0.9.2'
  homepage 'https://github.com/tailor-platform/patterner'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.9.2/patterner_v0.9.2_darwin_arm64.zip'
      sha256 '73e15fd841d20b7e0eed0c658df329abbaa8350e31fc78bc7763086a8355b6e5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.9.2/patterner_v0.9.2_darwin_amd64.zip'
      sha256 '30400d66b2adb9f49259e73099c7aa7417a874f0629dc2c436b2e1ce65375860'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.9.2/patterner_v0.9.2_linux_arm64.tar.gz'
      sha256 'ebb57382662b92f0270b6b3fe96ac13050130d18a25c8fcca8727e0c70cb361b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.9.2/patterner_v0.9.2_linux_amd64.tar.gz'
      sha256 '9aaee4ab85c2d4e4da320d8fc01ef2cde1a6f12b17eca028fa0a2db9aafcf72d'
    end
  end

  head do
    url 'https://github.com/tailor-platform/patterner.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'patterner'
    generate_completions_from_executable(bin/"patterner", "completion")
  end
end
