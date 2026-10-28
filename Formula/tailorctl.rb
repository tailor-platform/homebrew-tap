# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.15.0"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.15.0/tailorctl_darwin_v2.15.0_arm64.tar.gz"
      sha256 "1bd67dcb30eb9a82f05d05b0bbc1594b3e58e59601dd56c7f339ce161878a35c"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.15.0/tailorctl_darwin_v2.15.0_x86_64.tar.gz"
      sha256 "f05d22d6470f6cf9f9064be1cac7948b3798395611f9d887bf79fec53f93af09"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.15.0/tailorctl_linux_v2.15.0_arm64.tar.gz"
      sha256 "5a58bac36376bf8062d6b5021c35b6191b8b8b09f131fab88b1d0572100c20fa"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.15.0/tailorctl_linux_v2.15.0_x86_64.tar.gz"
      sha256 "5909bced30e4a580c4658bb8c40debec6e2112ce98495380693526c4d1cfc421"

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
