# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.7.1"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.7.1/tailorctl_darwin_v2.7.1_arm64.tar.gz"
      sha256 "54ebb406955bb01bc542d07855b9bc0d446bdc8754d33b754a11a258a1f9e039"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.7.1/tailorctl_darwin_v2.7.1_x86_64.tar.gz"
      sha256 "fdf5a80eb3cb37d94b8e03688b26856942e789103e1d7b2b4f1318b953879edc"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.7.1/tailorctl_linux_v2.7.1_arm64.tar.gz"
      sha256 "232aa9f6db1aec3360ccd88a3be123bf7c1e8147fd3b38da6fdd77ed53d40ae9"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.7.1/tailorctl_linux_v2.7.1_x86_64.tar.gz"
      sha256 "2cdc11184fac782ca8ece2e9dd0e99cadd8eb9cdf614ada6314648da2746841c"

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
