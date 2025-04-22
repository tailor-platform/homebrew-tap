# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "1.32.0"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.32.0/tailorctl_darwin_v1.32.0_arm64.tar.gz"
      sha256 "b08c8bba8c23d9e93c5417a0aa9c7297bc51b4abca627134921e6cb4599ad34c"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.32.0/tailorctl_darwin_v1.32.0_x86_64.tar.gz"
      sha256 "06e048b44b46e933f250b1e039447404e2502d053f93aba6018b3bfb645cc90c"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.32.0/tailorctl_linux_v1.32.0_arm64.tar.gz"
      sha256 "82a1daa73ed395282a007f3e0d65442c745a0612f1dae2f09dbfefe7b0fffbaf"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.32.0/tailorctl_linux_v1.32.0_x86_64.tar.gz"
      sha256 "722fdf3224c6982f5b286f64bc905f93ec51942cfd7df6054b994faeb4cc7a2e"

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
