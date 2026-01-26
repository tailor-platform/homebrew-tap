# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.8.13"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.13/tailorctl_darwin_v2.8.13_arm64.tar.gz"
      sha256 "8a4ac07f9acbeb7c59701a9aca964d25001df07e0de671e6a8c625a6422d497e"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.13/tailorctl_darwin_v2.8.13_x86_64.tar.gz"
      sha256 "ad783999cea942248b16a80417092b535da5b25487359621a029ed851b6f289a"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.13/tailorctl_linux_v2.8.13_arm64.tar.gz"
      sha256 "6f25387f214c7265a536e6098d55e48c08d8d693409373681db23dca38a83df6"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.13/tailorctl_linux_v2.8.13_x86_64.tar.gz"
      sha256 "fff9c26b2e74719cb69602984319e8a8bd7937fabe3086f55d20d5b64393e24a"

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
