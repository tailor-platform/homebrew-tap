class Patterner < Formula
  desc 'patterner is a tool to analyze and present best practices (patterns) for Tailor Platform applications.'
  version '0.4.1'
  homepage 'https://github.com/tailor-platform/patterner'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.4.1/patterner_v0.4.1_darwin_arm64.zip'
      sha256 '69ffec6d3faada4f5adb2bcda9c4e285ac2975c2ca38df0f313a3e134470da28'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.4.1/patterner_v0.4.1_darwin_amd64.zip'
      sha256 '80b4208bcf194130848acd266c53958faaefc1d67d55e79f3d16380621d8a85b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.4.1/patterner_v0.4.1_linux_arm64.tar.gz'
      sha256 'b14a785bfb1a8c8242ca2e27f3dec446ccb7e08df7e83a4db89dc392b4ba144b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.4.1/patterner_v0.4.1_linux_amd64.tar.gz'
      sha256 'f38791898d9b43d10376d775c8c1583d085abc292300f39422b836be28c76317'
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
