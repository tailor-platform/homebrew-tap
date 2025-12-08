# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.8.2"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.2/tailorctl_darwin_v2.8.2_arm64.tar.gz"
      sha256 "30a865ac76eeb60ef3bd13bd5e63d41faf3eb7a11d00e10b4ef7aceac2a2091f"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.2/tailorctl_darwin_v2.8.2_x86_64.tar.gz"
      sha256 "7435ed4ae94196a6e5a47e8570695795f17fd52af289d1aecdc753027b31b8eb"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.2/tailorctl_linux_v2.8.2_arm64.tar.gz"
      sha256 "c0cfb18ad568960d4de6de7954b8defa0204da48506369fab8fb46f5d5fac2b2"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.2/tailorctl_linux_v2.8.2_x86_64.tar.gz"
      sha256 "a71c228c1d42f7334e5f81620820817899ddf226ee01148af92ad4c238763c24"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  test do
    system "#{bin}/tailorctl version"
  end
end
