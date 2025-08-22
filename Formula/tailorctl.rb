# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.2.0"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.2.0/tailorctl_darwin_v2.2.0_arm64.tar.gz"
      sha256 "540f6fe196075a503bcd1f2c8755e7fc53949a465723868017ab44956d8bfa32"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.2.0/tailorctl_darwin_v2.2.0_x86_64.tar.gz"
      sha256 "78dbfc7aac22bb64f31fbdbc0c638e02c153a6bdc72149c081dee08b1577187c"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.2.0/tailorctl_linux_v2.2.0_arm64.tar.gz"
      sha256 "87a9291c0ff68ed9ba3834c179c4e133689899fa706e5923e4078135c5c4ee4a"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.2.0/tailorctl_linux_v2.2.0_x86_64.tar.gz"
      sha256 "f089a1813f9a8cb46502edeb2481dc06c4c642df71c5481fdbd064d95b1b5ef4"

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
