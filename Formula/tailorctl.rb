# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "1.30.0"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.30.0/tailorctl_darwin_v1.30.0_arm64.tar.gz"
      sha256 "3ac77408102b214a66d75de1a6eebe95ce92e2e9f7d4479393b03d57c5318fd3"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.30.0/tailorctl_darwin_v1.30.0_x86_64.tar.gz"
      sha256 "c05737173f9e78d8effa8c8b6aac7cc91c14ba35a7208235dcbb53eaa96edd43"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.30.0/tailorctl_linux_v1.30.0_arm64.tar.gz"
      sha256 "90c8c3286a7a10c18b0e7cc52c0da58cc2bb17398d2918b03d9f66f7033a113a"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.30.0/tailorctl_linux_v1.30.0_x86_64.tar.gz"
      sha256 "0eae5bde37f5567234e3e2b7401b1af907df216506f0256a3448696a0187179b"

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
