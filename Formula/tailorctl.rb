# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.1.0"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.1.0/tailorctl_darwin_v2.1.0_arm64.tar.gz"
      sha256 "9cad964d675d7dffc6bf0e82449dd0413a63dcc9f7e5b4c114521ff594d9e90c"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.1.0/tailorctl_darwin_v2.1.0_x86_64.tar.gz"
      sha256 "7490e9c567d45e8f01c71e1e5bab505dcb621c1b88f8d510dff5c1fcb3a39ef0"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.1.0/tailorctl_linux_v2.1.0_arm64.tar.gz"
      sha256 "985b24c3274816ceb7e0277956ff150b167ded14b39e8daf0ea5c4760dbfe4bd"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.1.0/tailorctl_linux_v2.1.0_x86_64.tar.gz"
      sha256 "0eb56913be8d285b82ded48cf108cbdfc747b1e6cb80a33647879c896f5dea3f"

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
