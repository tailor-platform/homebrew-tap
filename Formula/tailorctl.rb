# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.7.3"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.7.3/tailorctl_darwin_v2.7.3_arm64.tar.gz"
      sha256 "37d8c878e7643a587ad1fb28f0d4617ad352fccdf202c8be8c2a2a6c92a8a2f4"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.7.3/tailorctl_darwin_v2.7.3_x86_64.tar.gz"
      sha256 "a2f3d1be60dc5a1b500c96296b87e6d1af4c94c22524d0d8b959ae819ddfa44a"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.7.3/tailorctl_linux_v2.7.3_arm64.tar.gz"
      sha256 "440544956c0d081a66836da95aed1b9dee65d6dac4fa3511d3df57f8b5924bd6"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.7.3/tailorctl_linux_v2.7.3_x86_64.tar.gz"
      sha256 "0550515e53a3bfc7bcdf54b62a434c24642528fc16f24015a7bc33d9a1c8750d"

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
