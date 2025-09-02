# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.4.1"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.4.1/tailorctl_darwin_v2.4.1_arm64.tar.gz"
      sha256 "6e8923ad2ca510774fb0ffaff1be69df375eaa4b26e592df41f6d780306b3011"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.4.1/tailorctl_darwin_v2.4.1_x86_64.tar.gz"
      sha256 "2a8510bc06c7ec8bffa3cebceaabfa58a580be12812c90e1902c11751b7d4906"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.4.1/tailorctl_linux_v2.4.1_arm64.tar.gz"
      sha256 "bfcf46fecf35b216555faa847b0e9945fe8ad2344b5658369bdcdaff0013191a"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.4.1/tailorctl_linux_v2.4.1_x86_64.tar.gz"
      sha256 "5fa722029d0831e1c6a1a38ddb7f25fd70e60b6827d7f672df702c1c1117dbd1"

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
