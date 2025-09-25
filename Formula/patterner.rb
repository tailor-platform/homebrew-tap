class Patterner < Formula
  desc 'patterner is a tool to analyze and present best practices (patterns) for Tailor Platform applications.'
  version '0.7.1'
  homepage 'https://github.com/tailor-platform/patterner'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.7.1/patterner_v0.7.1_darwin_arm64.zip'
      sha256 '468c6901238ac3f1e00b5465a2e9626a4c5cddb7c1f118c09910436a5e5afc61'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.7.1/patterner_v0.7.1_darwin_amd64.zip'
      sha256 'ff9e33687fef51d8d348037b50b723b18fdc2eceaba2f68d1c84fa59b07e06ff'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.7.1/patterner_v0.7.1_linux_arm64.tar.gz'
      sha256 'd27e60ed4bca4257ebeca79501532811e60eb38ec05768c38defdffc74b0e9be'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.7.1/patterner_v0.7.1_linux_amd64.tar.gz'
      sha256 '1664db8ff896c58f795ca9f440e8728cc97dc0c5608bfe899b3328ce315c0c76'
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
