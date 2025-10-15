# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.6.1"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.6.1/tailorctl_darwin_v2.6.1_arm64.tar.gz"
      sha256 "baed75368b57a8cd23ea37e69c79356d071ebc6c4e4cc4a9339ceaea2e57339f"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.6.1/tailorctl_darwin_v2.6.1_x86_64.tar.gz"
      sha256 "9530d54bc156d42c5ea4fed70e9154b5c5000abbef362ab4fe73724aa756579e"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.6.1/tailorctl_linux_v2.6.1_arm64.tar.gz"
      sha256 "a5ddbbe632d5fa3f0ef5b2183eeef7b10bb4649710cb4ba71286f9a9efcfc1df"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.6.1/tailorctl_linux_v2.6.1_x86_64.tar.gz"
      sha256 "e36418c2501ac8142fbbb1d18280c9fc1ceec50e0d8ac54cb765108245d3c8dc"

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
