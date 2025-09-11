class Patterner < Formula
  desc 'patterner is a tool to analyze and present best practices (patterns) for Tailor Platform applications.'
  version '0.4.2'
  homepage 'https://github.com/tailor-platform/patterner'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.4.2/patterner_v0.4.2_darwin_arm64.zip'
      sha256 '4d182ae9fcf81a8183c344aabb3de4d48901d78c788f1e05e4d9706050380fe8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.4.2/patterner_v0.4.2_darwin_amd64.zip'
      sha256 'f608b95861e81ee742fd30a770d5167d57b6b58e6a2b4f9a35147680314ac9f1'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.4.2/patterner_v0.4.2_linux_arm64.tar.gz'
      sha256 'd8e2941c1edb918a2262fe22a91cd52718baf19c4d6300a89dc04087208aa405'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/tailor-platform/patterner/releases/download/v0.4.2/patterner_v0.4.2_linux_amd64.tar.gz'
      sha256 '289492230db4068461b02b0093a77983c6644bc7f820f8fc051f21b68fb3bb32'
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
