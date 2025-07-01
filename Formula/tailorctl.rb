# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "1.33.0"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.33.0/tailorctl_darwin_v1.33.0_arm64.tar.gz"
      sha256 "21229810e5549632cb8cd1fa5bc57124a7e9feb4140117a9edfe4f7f1990e1a5"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.33.0/tailorctl_darwin_v1.33.0_x86_64.tar.gz"
      sha256 "75ef154a48b156a2f6d0f0db62d39b0c1cffa54fa66825872a230fafac607f07"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.33.0/tailorctl_linux_v1.33.0_arm64.tar.gz"
      sha256 "bc2f8e6463375b18280e4378c84a4c602905d6a98b627cf7885deff9ca1a782d"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.33.0/tailorctl_linux_v1.33.0_x86_64.tar.gz"
      sha256 "159e577eca3df83dbbf031055ea6237a1546d225e9b2511bcbff53d1bb49e3aa"

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
