class Patterner < Formula
  desc 'patterner is a tool to analyze and present best practices (patterns) for Tailor Platform applications.'
  version '0.5.0'
  homepage 'https://github.com/tailor-platform/patterner'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.5.0/patterner_v0.5.0_darwin_arm64.zip'
      sha256 'db884a78cc675f5b441282c8763385fcf723c2f84bdf5ca10c2c12a3398b4bba'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.5.0/patterner_v0.5.0_darwin_amd64.zip'
      sha256 '4ca3b273f28a6ba2b8cecb92d3b38241764a6553a149583dab78c36df9f61224'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.5.0/patterner_v0.5.0_linux_arm64.tar.gz'
      sha256 '4a2176bf34e337ec2a9937f330de6a1e963ec3ff81f7dbef62f2cbf76df164b6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.5.0/patterner_v0.5.0_linux_amd64.tar.gz'
      sha256 '8d865562bf826361c049525a7276426e68cf3a2871424d6d34c4016c90ee826b'
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
