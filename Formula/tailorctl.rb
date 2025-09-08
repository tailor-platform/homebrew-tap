# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.4.3"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.4.3/tailorctl_darwin_v2.4.3_arm64.tar.gz"
      sha256 "ff446760b30d38f8851917c31bd5aad51c8f4e4037c7578686edb1236be41f8d"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.4.3/tailorctl_darwin_v2.4.3_x86_64.tar.gz"
      sha256 "26b62e0cf7e1adb7b05d7801a161991065ad2d3b3984e4386ea89712bf103cc1"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.4.3/tailorctl_linux_v2.4.3_arm64.tar.gz"
      sha256 "ce08938646f07f3def46a4c553e6f00f0b1ac62d31eaad660b80c550045c6337"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.4.3/tailorctl_linux_v2.4.3_x86_64.tar.gz"
      sha256 "0f0dda5c3b029d9747074b4ba665e28d4052abc011bdba5087283483843f691d"

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
