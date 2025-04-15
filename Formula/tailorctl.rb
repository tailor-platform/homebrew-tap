# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "1.31.1"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.31.1/tailorctl_darwin_v1.31.1_arm64.tar.gz"
      sha256 "c8d817c09876a387fe3331109607c57ec34eac4155939a688ffe9c1009e3d45f"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.31.1/tailorctl_darwin_v1.31.1_x86_64.tar.gz"
      sha256 "0986507d61abc2b6b24533c045b8eb038d41fc417227308ab8cf90587bea1137"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.31.1/tailorctl_linux_v1.31.1_arm64.tar.gz"
      sha256 "74c9cf9ffe633fe4d701c66aed9967176ebc325ddf3d47dba958212a5bbaab44"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.31.1/tailorctl_linux_v1.31.1_x86_64.tar.gz"
      sha256 "373eb5d985482c11cef2f0217ffbaefe37363d650a564216a388373cedf9679a"

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
