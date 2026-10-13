# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.13.0"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.13.0/tailorctl_darwin_v2.13.0_arm64.tar.gz"
      sha256 "8ecaabd0a21af2018ffe5b10e200c5c208cd712d57ba64b5b1da6f1b9a8fa839"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.13.0/tailorctl_darwin_v2.13.0_x86_64.tar.gz"
      sha256 "4f318ae4704a37f2573097958f571a09cdaba4ae0fd545264a8b00f10b1f64cc"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.13.0/tailorctl_linux_v2.13.0_arm64.tar.gz"
      sha256 "b045b8899348fc1e4c2dd4e496059df339b305973dde6cc597463223005e8475"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.13.0/tailorctl_linux_v2.13.0_x86_64.tar.gz"
      sha256 "d93d49712ee9f5312830a7a2d22d838df030dfd00aea5e4a1eb48f44e8016dc5"

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
