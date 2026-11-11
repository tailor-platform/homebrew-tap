# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.16.1"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.16.1/tailorctl_darwin_v2.16.1_arm64.tar.gz"
      sha256 "fd498eb76c23413022e112c0aee2fb53f3fdba48c42ba395a9ff62eeda3121ba"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.16.1/tailorctl_darwin_v2.16.1_x86_64.tar.gz"
      sha256 "73b292c91bc652bf2af2be6c7596d1cf2ed1fec2ac15ce654120d1b87119f272"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.16.1/tailorctl_linux_v2.16.1_arm64.tar.gz"
      sha256 "247e8152a06e8006c6af6e875caecbacefc3f9f7cb393339a493671bf6d09510"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.16.1/tailorctl_linux_v2.16.1_x86_64.tar.gz"
      sha256 "7ddc25028c409ca3a1585f3d1a9ffdb3cc44c35f4c12fa2f7697a8b0c7dbaa65"

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
