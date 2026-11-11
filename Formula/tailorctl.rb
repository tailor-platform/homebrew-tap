# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.16.0"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.16.0/tailorctl_darwin_v2.16.0_arm64.tar.gz"
      sha256 "9255766bd42596f9aa7c6edf5c15816a4b3bee656047f0a12d7cc166a18de18a"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.16.0/tailorctl_darwin_v2.16.0_x86_64.tar.gz"
      sha256 "76738de71b1571cedda54e088c05c5b28d67abd868c1878346f1cdfde8d5ccae"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.16.0/tailorctl_linux_v2.16.0_arm64.tar.gz"
      sha256 "69b04e2b038bc6e2b9e068ad45c3d5705e45982e5fb2d93bf9578822370b8c48"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.16.0/tailorctl_linux_v2.16.0_x86_64.tar.gz"
      sha256 "8789ce766799b41487eb7ea4b8485e63801e1012a159e207edf27e421bbba3e7"

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
