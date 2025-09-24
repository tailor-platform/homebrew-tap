class Patterner < Formula
  desc 'patterner is a tool to analyze and present best practices (patterns) for Tailor Platform applications.'
  version '0.7.0'
  homepage 'https://github.com/tailor-platform/patterner'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.7.0/patterner_v0.7.0_darwin_arm64.zip'
      sha256 'e4a387838fcea4fb21aa7df71f09a6ab610fde5aa714c4f3b390efbc2bed4b73'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.7.0/patterner_v0.7.0_darwin_amd64.zip'
      sha256 'e75389a6e043c6d4d7821988d8b5509314890656f7de6600875c3db3e283f8ef'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.7.0/patterner_v0.7.0_linux_arm64.tar.gz'
      sha256 'df63d14e9c239b0b6b8f700104f9c1d16a77278ca891916dfdf619f3a3048aef'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.7.0/patterner_v0.7.0_linux_amd64.tar.gz'
      sha256 'b4c41d7add622bdef578f4dd407ac9ce930e2c3e3af9a2b306c9a557b6de7bc4'
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
