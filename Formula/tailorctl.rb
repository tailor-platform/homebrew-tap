# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "1.33.1"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.33.1/tailorctl_darwin_v1.33.1_arm64.tar.gz"
      sha256 "aeec054f67db8e5478b2ebb908623bd995ac4361a3100a209cbb5e8dae2bf913"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.33.1/tailorctl_darwin_v1.33.1_x86_64.tar.gz"
      sha256 "e7c038c412c4c93e757c8dca250d4f8a6445ae29ba27912fab5eaa00df111bc0"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.33.1/tailorctl_linux_v1.33.1_arm64.tar.gz"
      sha256 "3ff2f62d97d31ef8ae42bf47caf34b8026637a606a9241be1cd5e7ede33605c0"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.33.1/tailorctl_linux_v1.33.1_x86_64.tar.gz"
      sha256 "531419b0e6401397a22f86bf9f8b4e61fe385359f7fb943c2790bc8a7c53f6a7"

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
