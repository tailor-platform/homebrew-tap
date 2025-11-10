# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.7.0"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.7.0/tailorctl_darwin_v2.7.0_arm64.tar.gz"
      sha256 "b1cab7c30fffd4e5f7ff8b2d733babd7b4a35b4c04f5d143ab1b96d871283b33"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.7.0/tailorctl_darwin_v2.7.0_x86_64.tar.gz"
      sha256 "3697a8abf8310cf138d1613dba9a7c96cf2945ec4846010cf5b2b8d92bd7e9e1"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.7.0/tailorctl_linux_v2.7.0_arm64.tar.gz"
      sha256 "9e57a449c58a177608b4c0f4f337d580ce58ec3ad2efa2abfcff8e1a8992f49a"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.7.0/tailorctl_linux_v2.7.0_x86_64.tar.gz"
      sha256 "dbc019ac33344e95715547493cb3e5e465e58e4e895e40be9c3840b654700f1c"

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
