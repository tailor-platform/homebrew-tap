# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.8.3"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.3/tailorctl_darwin_v2.8.3_arm64.tar.gz"
      sha256 "4e5721309e5553ae46e413bfd173a32a72cd6dc4966c56d51eb11bd8377e28c7"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.3/tailorctl_darwin_v2.8.3_x86_64.tar.gz"
      sha256 "93f619e18bdf8bb9e0ab45d2cd263b00f499a551cb67125a294c3651b32805cf"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.3/tailorctl_linux_v2.8.3_arm64.tar.gz"
      sha256 "d1457250e3609d6dcabc433e143c73165f918c22531995676369b6c09048081f"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.3/tailorctl_linux_v2.8.3_x86_64.tar.gz"
      sha256 "c76949557487e8ebe2a44cf031fa2432b70eeeba7f94329483e9b2fbbe9f64f2"

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
