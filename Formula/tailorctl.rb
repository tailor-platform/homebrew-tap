# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.0.0"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.0.0/tailorctl_darwin_v2.0.0_arm64.tar.gz"
      sha256 "02735e4a05aaf44d78f1c6b5ce002da5cd2ee6898f56134c74850156354f7aa0"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.0.0/tailorctl_darwin_v2.0.0_x86_64.tar.gz"
      sha256 "f047f21e4ffa2401fad016f79a00c0cfaf18d8aa73108b096d8491f3797b1e2c"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.0.0/tailorctl_linux_v2.0.0_arm64.tar.gz"
      sha256 "779f566ee9a68ed43535dcceafd7c7fed43a9dee5251692243671736c7b61242"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.0.0/tailorctl_linux_v2.0.0_x86_64.tar.gz"
      sha256 "08968637bbf4aef865347120469892e2318bdeeb93ec52dba77bee4128cc6683"

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
