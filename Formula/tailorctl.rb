# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.7.2"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.7.2/tailorctl_darwin_v2.7.2_arm64.tar.gz"
      sha256 "41109774738afd8c53786382c740228f81a9f4f21fd367598f55587c088a2074"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.7.2/tailorctl_darwin_v2.7.2_x86_64.tar.gz"
      sha256 "e2dba582453e891295cde49678f17adabd9174745fd42f98eafeaf8d6770caef"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.7.2/tailorctl_linux_v2.7.2_arm64.tar.gz"
      sha256 "cc04e54c17586b8eeca11e4f542ddf768f5b7bb53bf31ecb50a6c51d8410b161"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.7.2/tailorctl_linux_v2.7.2_x86_64.tar.gz"
      sha256 "eca7003e4881bf6058ab51fad924eba7fad13c879ba04557e3d9c8918f42fcea"

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
