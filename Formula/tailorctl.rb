# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.11.1"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.11.1/tailorctl_darwin_v2.11.1_arm64.tar.gz"
      sha256 "821fccf5447e8994de5f66cf56539b9a82b292a5285d3e74fdf59f40d76f59ec"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.11.1/tailorctl_darwin_v2.11.1_x86_64.tar.gz"
      sha256 "f36c58c5f9ab56da549b98ba098459d221b2e4c9c72631b1fca5d231ac171460"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.11.1/tailorctl_linux_v2.11.1_arm64.tar.gz"
      sha256 "66edf71b885f23e3d33f25deedfad0a5683e6fd27d875a14b4d82e639397092e"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.11.1/tailorctl_linux_v2.11.1_x86_64.tar.gz"
      sha256 "a1d3ebbf70537351327f872cfa386c69214cfb7798978e9d967b9d7cd0c4b168"

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
