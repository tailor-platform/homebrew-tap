# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.11.0"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.11.0/tailorctl_darwin_v2.11.0_arm64.tar.gz"
      sha256 "9533393cf03277e2393f0a2e1bf3043d81a7cb1f21dc87c49f77aab1a4f8e604"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.11.0/tailorctl_darwin_v2.11.0_x86_64.tar.gz"
      sha256 "985cf4cc84ecdf39e2a418c43f74cd3ed410443cb63f0837262509ec389f1a48"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.11.0/tailorctl_linux_v2.11.0_arm64.tar.gz"
      sha256 "2a73206257a126ced9f6d9bd552dfd5e7aa9d253ecd1b19be6bd2125e356894c"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.11.0/tailorctl_linux_v2.11.0_x86_64.tar.gz"
      sha256 "289fa658dda36ffb6ab1c7563bcb2c9191c9bf3051a8252f66dcbdab0ee9722f"

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
