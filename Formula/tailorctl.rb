# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.6.0"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.6.0/tailorctl_darwin_v2.6.0_arm64.tar.gz"
      sha256 "6962f4bdd528be21064f0d1531829b620dd2f754ac4eb0407e61b8eecf37fbce"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.6.0/tailorctl_darwin_v2.6.0_x86_64.tar.gz"
      sha256 "c207a381623bb2a89f90fa8f12b90eabc8ed48eaf4f9569e42c4044398ff2968"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.6.0/tailorctl_linux_v2.6.0_arm64.tar.gz"
      sha256 "2f78664f8c1b4666afe8233c2057634d0387c20bc60c99a5ed5b9b55dae21f34"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.6.0/tailorctl_linux_v2.6.0_x86_64.tar.gz"
      sha256 "573db3d13d50be59bda0b4482f0f444fe86b5f1b6d2e958b564ad245b6dc52f2"

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
