class Patterner < Formula
  desc 'patterner is a tool to analyze and present best practices (patterns) for Tailor Platform applications.'
  version '0.8.0'
  homepage 'https://github.com/tailor-platform/patterner'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.8.0/patterner_v0.8.0_darwin_arm64.zip'
      sha256 'a12c785112c48f50e8848c8da597c544308200785eddfcd6fe2f2743f0ddad51'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.8.0/patterner_v0.8.0_darwin_amd64.zip'
      sha256 '8c64db2fd529805fe9a6a41c0029cdf138de8e670916bd8fb9ff6f1b1f3994ba'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.8.0/patterner_v0.8.0_linux_arm64.tar.gz'
      sha256 '4ece581a2057549f609c4adfa2b3831994ad32198dcb7040f5dd0cc27b746191'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.8.0/patterner_v0.8.0_linux_amd64.tar.gz'
      sha256 '493b40e50370246b12da486f5954d9a900fb0ac1a42afc936d3c70a8a578d90c'
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
