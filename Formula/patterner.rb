class Patterner < Formula
  desc 'patterner is a tool to analyze and present best practices (patterns) for Tailor Platform applications.'
  version '0.9.1'
  homepage 'https://github.com/tailor-platform/patterner'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.9.1/patterner_v0.9.1_darwin_arm64.zip'
      sha256 'a1a00760a9e2c4776cc68d5d4d48d63c4a27f5cfbf911f464b471a4d4a4ab4ca'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.9.1/patterner_v0.9.1_darwin_amd64.zip'
      sha256 '82c2421e0e44bf36c131f86f79f3103b8f38bd47ed59912cc211e234ee68990d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.9.1/patterner_v0.9.1_linux_arm64.tar.gz'
      sha256 '78a65b107e37c8adc71131633b910c08dccafaecb1950649599ed456df9394e2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.9.1/patterner_v0.9.1_linux_amd64.tar.gz'
      sha256 '641b9b1d4528df90e6f1a0a4a307831e19c6d001f88be445b362bcf134282646'
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
