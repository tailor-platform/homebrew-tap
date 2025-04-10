# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "1.31.0"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.31.0/tailorctl_darwin_v1.31.0_arm64.tar.gz"
      sha256 "20a0d1bfc362894a4b157540eaac7929670e8aa5305d0523d570aafe2dd324df"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.31.0/tailorctl_darwin_v1.31.0_x86_64.tar.gz"
      sha256 "9a42ec62bbe86662fb51830ebc7d4101790acc2a81fb3208095e00c3d9fc05d3"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.31.0/tailorctl_linux_v1.31.0_arm64.tar.gz"
      sha256 "83f083d0b875f35a942bad3055f72b66d09f737c6a5ed545fc064d3823b5347d"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.31.0/tailorctl_linux_v1.31.0_x86_64.tar.gz"
      sha256 "9292f2c4b41895b0d8faf9ba9465ae4cc0c003a4c5c233e31ea8549bef0c7ad7"

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
