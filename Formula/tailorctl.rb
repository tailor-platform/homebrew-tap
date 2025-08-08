# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.0.2"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.0.2/tailorctl_darwin_v2.0.2_arm64.tar.gz"
      sha256 "cc209fc85bbffab7fa9dc9019d287e14cc877a34f0dedd57812cbe8bd6980bea"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.0.2/tailorctl_darwin_v2.0.2_x86_64.tar.gz"
      sha256 "30ca4dccc00908dacc15a23d3838a16f3603c028c7723d4287925ad72741c567"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.0.2/tailorctl_linux_v2.0.2_arm64.tar.gz"
      sha256 "d246e27d35d56c2c381a7ed620884123388fc060ae9e6b431757bc487b9f11e9"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.0.2/tailorctl_linux_v2.0.2_x86_64.tar.gz"
      sha256 "269ead6226a1af9d36b453b881aa3d712ad6f0495c972ed5f334288e8d4101ac"

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
