# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.16.3"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.16.3/tailorctl_darwin_v2.16.3_arm64.tar.gz"
      sha256 "5cbe7cee9569a4654fab72b5a622b17ff30124063b28d67380680bd6476e756c"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.16.3/tailorctl_darwin_v2.16.3_x86_64.tar.gz"
      sha256 "268831ef7206c4fe3112c959116a50ab0c4bd081e4f324f07300012da4ac3ddf"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.16.3/tailorctl_linux_v2.16.3_arm64.tar.gz"
      sha256 "9b8588c7b11597e41c5f3ec6160ee388ec4b7216123a84dd24e2f313b1bcc782"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.16.3/tailorctl_linux_v2.16.3_x86_64.tar.gz"
      sha256 "a00d5a21aa1fede5c5cf5b0429061cd38cc6c0ca9c9ffee766a580c2a64d1105"

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
