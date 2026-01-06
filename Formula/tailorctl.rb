# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.8.10"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.10/tailorctl_darwin_v2.8.10_arm64.tar.gz"
      sha256 "3210c72a006da6ccdb49188fe7955418fbb808e5a196b751757bb8cb93f395d7"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.10/tailorctl_darwin_v2.8.10_x86_64.tar.gz"
      sha256 "7d0b96efaf97e227cec60ea5f0bde3c78efba97519aa51842bd763e2ce1d76f4"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.10/tailorctl_linux_v2.8.10_arm64.tar.gz"
      sha256 "7f8e38db5ecdfb1134448d04f47b6cbddd6c6c5aefc4447357584dd280aef01b"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.10/tailorctl_linux_v2.8.10_x86_64.tar.gz"
      sha256 "489bf21653173cd4e492b96885fdf177a70742e014fce694762626fcf0255a6c"

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
