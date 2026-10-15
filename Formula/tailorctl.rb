# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.13.1"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.13.1/tailorctl_darwin_v2.13.1_arm64.tar.gz"
      sha256 "2f43e4edb51a2260d298b7266bae2918c6052deb447d3e4e181cf1c976c9009b"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.13.1/tailorctl_darwin_v2.13.1_x86_64.tar.gz"
      sha256 "fb78de6e2fe321463eefeaa88ce196de19667d0b143532d19a13f068fea91d09"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.13.1/tailorctl_linux_v2.13.1_arm64.tar.gz"
      sha256 "8ac99b9936964050854a57818af6c4a83f0564be8d1529fc7f52a690cc948d73"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.13.1/tailorctl_linux_v2.13.1_x86_64.tar.gz"
      sha256 "c510a7ebf89fdf38b87063e8b831f708f822e5178781d9a8879a1dc43c749a2d"

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
