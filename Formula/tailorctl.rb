# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "1.29.1"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.29.1/tailorctl_darwin_v1.29.1_arm64.tar.gz"
      sha256 "01e55dca92256e292b3aa9cdaa7f97c1f3ece947cdafdb2942fd8cc62573cfa3"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.29.1/tailorctl_darwin_v1.29.1_x86_64.tar.gz"
      sha256 "a2a0250b809ebd0bd0cc5a162dbc3b7e4d08f9345426952105e3ed4f7ff05d93"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.29.1/tailorctl_linux_v1.29.1_arm64.tar.gz"
      sha256 "1d24ef161e21b39db68d0f761f61e3b339d4cefa0233ef53e3feb35c828e1ed5"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.29.1/tailorctl_linux_v1.29.1_x86_64.tar.gz"
      sha256 "c3e182c55fd643e965b62a36b0fd62687b3944754d7cb676aa6b98f474f337c7"

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
