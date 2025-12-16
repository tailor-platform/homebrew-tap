# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.8.4"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.4/tailorctl_darwin_v2.8.4_arm64.tar.gz"
      sha256 "301474241f592bc7b316e9fe1becfb4d87cf0f25c74624f2cf0ca80db3cc6355"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.4/tailorctl_darwin_v2.8.4_x86_64.tar.gz"
      sha256 "06360a97bb33b52d7d32e6fe896f73304ea6eb20be21cd253ffd1f24d09ddd96"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.4/tailorctl_linux_v2.8.4_arm64.tar.gz"
      sha256 "1ae4a0257af5e5431ef1a8e6eeb6e58fa2401bfc761d84882b9a03b3d8177f22"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.4/tailorctl_linux_v2.8.4_x86_64.tar.gz"
      sha256 "966dd48d9dc54b1295b2e4828538e5a6517ed61e4f0a5c48c4d4185b2858bbab"

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
