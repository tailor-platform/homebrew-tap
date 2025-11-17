class Patterner < Formula
  desc 'patterner is a tool to analyze and present best practices (patterns) for Tailor Platform applications.'
  version '0.9.0'
  homepage 'https://github.com/tailor-platform/patterner'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.9.0/patterner_v0.9.0_darwin_arm64.zip'
      sha256 '86ba8b54927aa305f703581eb5dc71912a32a40ce01a6a1a9f9d7c988dff0100'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.9.0/patterner_v0.9.0_darwin_amd64.zip'
      sha256 '0356e8009a255dd6817084f8f8b0e80ad74ae89549e9d7489295d2b98ccd1b01'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.9.0/patterner_v0.9.0_linux_arm64.tar.gz'
      sha256 '3a74d7ea84da27fd979680dbece816836c5460e345068f2caf1d6581fbe4cc91'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.9.0/patterner_v0.9.0_linux_amd64.tar.gz'
      sha256 '91cccd03458fa93c136f1ba992d868e8f60b3c8dd283f2610d2485a1e166cb0b'
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
