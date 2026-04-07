# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.9.1"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.9.1/tailorctl_darwin_v2.9.1_arm64.tar.gz"
      sha256 "9aca72db42a1a9c3685442f0af3393f9d301bf7553fa30d6367954c8d35dfdf1"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.9.1/tailorctl_darwin_v2.9.1_x86_64.tar.gz"
      sha256 "9dd3cd721d8a69bde636145d5c3fd323fd3e831bce97bbbdd5e962f797759e6b"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.9.1/tailorctl_linux_v2.9.1_arm64.tar.gz"
      sha256 "8c047004304cc16a290ab611c5077470555620cb751cb69973f984e15d4c2138"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.9.1/tailorctl_linux_v2.9.1_x86_64.tar.gz"
      sha256 "52f92cda139c965758a4b884c9cd25bde9927fa103e997c12e01969f4980a785"

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
