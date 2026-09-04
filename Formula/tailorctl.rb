# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.12.0"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.12.0/tailorctl_darwin_v2.12.0_arm64.tar.gz"
      sha256 "fc51369a852f3880fbad0bf49528e5df56c9da5311f0d6748e5cbbf021d2b2ea"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.12.0/tailorctl_darwin_v2.12.0_x86_64.tar.gz"
      sha256 "a3af15cc52f610f8ae85acd1617eb65b31960ab9358dda78ad98a231706b0658"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.12.0/tailorctl_linux_v2.12.0_arm64.tar.gz"
      sha256 "895f376bff14b6840c2f15c8268b0d258511f592953c57b0ef20e5859e9c2504"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.12.0/tailorctl_linux_v2.12.0_x86_64.tar.gz"
      sha256 "1fe79eb93fdc3eada319489807106fdbe1d1fbbc7980b01e6ebba57244085131"

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
