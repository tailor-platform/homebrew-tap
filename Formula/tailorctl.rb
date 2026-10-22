# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.14.0"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.14.0/tailorctl_darwin_v2.14.0_arm64.tar.gz"
      sha256 "1e893c10dd1e4b3c30e63143031a186deb3cc471095a77016c629a2ed39c2df8"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.14.0/tailorctl_darwin_v2.14.0_x86_64.tar.gz"
      sha256 "5dd56a8f19d5494b6c9aa407eb8abae7fe67c2dffeeca8d42aee0363134cb0e5"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.14.0/tailorctl_linux_v2.14.0_arm64.tar.gz"
      sha256 "3a39dba14cdf78be4a1317940ddafda0ba1062190d9988fbc1aeaf3fc5099858"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.14.0/tailorctl_linux_v2.14.0_x86_64.tar.gz"
      sha256 "bd092e2406ad5cfc3f229009b2d9d1d6051bf4a30300e8746f03cb003677194e"

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
