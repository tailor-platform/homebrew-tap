# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.8.7"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.7/tailorctl_darwin_v2.8.7_arm64.tar.gz"
      sha256 "2987eb961a1c8f0b7902ff3257a6ccb86d68a57ee4a5b6fd092433b1b42ea2ae"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.7/tailorctl_darwin_v2.8.7_x86_64.tar.gz"
      sha256 "f08de497f91172bf8a27ccd2dc7574165d517774bd88784b2f4ca3bd5a01dbe5"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.7/tailorctl_linux_v2.8.7_arm64.tar.gz"
      sha256 "a1348e2f464f4e45491d12211cb3c71be73f87453442e4d952246670ac0bfedb"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.7/tailorctl_linux_v2.8.7_x86_64.tar.gz"
      sha256 "98d4da93330f6c212d0ddb6c939d1e4f08aaa2afdf7fb40eb45cb764d94b3086"

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
