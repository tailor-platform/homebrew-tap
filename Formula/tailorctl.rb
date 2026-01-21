# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.8.12"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.12/tailorctl_darwin_v2.8.12_arm64.tar.gz"
      sha256 "a5535bbc00e6d8a1ec3dcc3e002b3cc5376c08669cf65c5159dae01b949b8ee7"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.12/tailorctl_darwin_v2.8.12_x86_64.tar.gz"
      sha256 "7ff0a08fa1b44b6119bb3471f1e55efff9ab279510e321d9e26cde4e5ddfaf95"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.12/tailorctl_linux_v2.8.12_arm64.tar.gz"
      sha256 "8a5ba7205683582063b6358a3f72c3934d93a6b8d46ff89c2073fefb592fa31b"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.12/tailorctl_linux_v2.8.12_x86_64.tar.gz"
      sha256 "7990fb80dcc0ec6056923f9cd1fd024925087c78cd59df667bd37200b837f98a"

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
