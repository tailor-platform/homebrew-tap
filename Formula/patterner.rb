class Patterner < Formula
  desc 'patterner is a tool to analyze and present best practices (patterns) for Tailor Platform applications.'
  version '0.6.0'
  homepage 'https://github.com/tailor-platform/patterner'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.6.0/patterner_v0.6.0_darwin_arm64.zip'
      sha256 '814e5c41600eda6612598daa89cbe3a3a8a88be3b43e0441075379b35960c8d4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.6.0/patterner_v0.6.0_darwin_amd64.zip'
      sha256 '8015d7d58280392210d6dc2e2188f801b0069f658699c2e0578bd2e702bb214b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.6.0/patterner_v0.6.0_linux_arm64.tar.gz'
      sha256 '03f0807de6d51fc10ef3a0bcf3f29fbf1116412470f8ac93a75573935a4c9c53'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.6.0/patterner_v0.6.0_linux_amd64.tar.gz'
      sha256 'f83b53e3a02d870ad7ec9b6076da3e1d1f57ef9133cdfe40057bbb48e2c2881a'
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
