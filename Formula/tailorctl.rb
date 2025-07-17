# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.0.1"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.0.1/tailorctl_darwin_v2.0.1_arm64.tar.gz"
      sha256 "c7aec9b892a52e4c143f212e0fbe878068a36b3b2bbba5d1876e34e797b7dcb0"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.0.1/tailorctl_darwin_v2.0.1_x86_64.tar.gz"
      sha256 "bb874a57984228a3d6a348dadd6262cce461b1efc5b79a5fd9e905c981b30b04"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.0.1/tailorctl_linux_v2.0.1_arm64.tar.gz"
      sha256 "4e31c13796b8c8d2712809240d13f3f0379ba0d108be21ee7c67e4839ee868e5"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.0.1/tailorctl_linux_v2.0.1_x86_64.tar.gz"
      sha256 "2ff9a91c18d9cc2cc8b27377edbbc4fa7d05465ee7fbbb6e27f83b5c3c41f78e"

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
