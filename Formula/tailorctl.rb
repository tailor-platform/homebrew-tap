# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.9.2"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.9.2/tailorctl_darwin_v2.9.2_arm64.tar.gz"
      sha256 "407f66d338aeca46803e3a59fa999e1047334137e4b64f7e478851dc6e030616"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.9.2/tailorctl_darwin_v2.9.2_x86_64.tar.gz"
      sha256 "9c79f0b7c49f9426eac93378942705c3efd5dcfe9d1cd0e33b279446d6c7bcfa"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.9.2/tailorctl_linux_v2.9.2_arm64.tar.gz"
      sha256 "a1cebdb7aa29699816c90fc61481bd7aae3d4d36b8041cdae8609ba0cb2066eb"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.9.2/tailorctl_linux_v2.9.2_x86_64.tar.gz"
      sha256 "8a7c434200e45a2a65490eb8e6ccff87804faa9c2e9c945e83787958df2d9e9c"

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
