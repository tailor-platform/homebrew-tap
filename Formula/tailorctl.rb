# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "1.33.2"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.33.2/tailorctl_darwin_v1.33.2_arm64.tar.gz"
      sha256 "f5626039071120028d6203396feb8b80df765327f134491221136913f7228563"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.33.2/tailorctl_darwin_v1.33.2_x86_64.tar.gz"
      sha256 "4838105b2dd9bf166fe2f8682350f7dbf6320a93996d6c40c1469a47ca8d683c"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.33.2/tailorctl_linux_v1.33.2_arm64.tar.gz"
      sha256 "c8b47ad814b2b2b4e4d1e3ac53d7e0fbe501c5ac985d2f6857324d69b8799b94"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.33.2/tailorctl_linux_v1.33.2_x86_64.tar.gz"
      sha256 "3356af60b234be549808b16cec14c73e4646f110dca71197fc0bb76d0d368948"

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
