# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.8.15"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.15/tailorctl_darwin_v2.8.15_arm64.tar.gz"
      sha256 "73a21b7a5e7d70ead3d343fcd597e73ff7af23fa99c6465b4a8a71332d6cf547"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.15/tailorctl_darwin_v2.8.15_x86_64.tar.gz"
      sha256 "f8cf2cb415030dd5580a49a07e90bb164002af8ce62b32b69057d6288cc91c68"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.15/tailorctl_linux_v2.8.15_arm64.tar.gz"
      sha256 "34ad69a8a0ff09460676f3db6e1502efde8648cfeb21816c754eb70a65c01a4b"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.15/tailorctl_linux_v2.8.15_x86_64.tar.gz"
      sha256 "7d4897198e4d93eb1a9e93fe2cde300e5460b4128f1e5c559018c44c28802616"

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
