class Patterner < Formula
  desc 'patterner is a tool to analyze and present best practices (patterns) for Tailor Platform applications.'
  version '0.9.3'
  homepage 'https://github.com/tailor-platform/patterner'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.9.3/patterner_v0.9.3_darwin_arm64.zip'
      sha256 'fd7b76c7d9bcc7f1f5e312055e6ae5e8ee8dfe4056fe692f35d538443ad53c80'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.9.3/patterner_v0.9.3_darwin_amd64.zip'
      sha256 '621ee9ace45c6dc86b1f584e9e73607b7e187cd3874774127a4471534e6b7fd8'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.9.3/patterner_v0.9.3_linux_arm64.tar.gz'
      sha256 '4ee8654bf2179e2a97f576de5c798d862d40970b6fc3d87bf03fca78ab9e8988'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.9.3/patterner_v0.9.3_linux_amd64.tar.gz'
      sha256 '1e1a87952e8c801af25f15e8add14fe69dafec109efafa9f892bbed21a550c75'
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
