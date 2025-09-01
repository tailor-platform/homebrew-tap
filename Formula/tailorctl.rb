# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.3.0"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.3.0/tailorctl_darwin_v2.3.0_arm64.tar.gz"
      sha256 "84cf235947153a147a715c17dfa1a5460178c2198fe99879b9d3c7e08f6c6b76"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.3.0/tailorctl_darwin_v2.3.0_x86_64.tar.gz"
      sha256 "b20e929ef771e0a58093a359b2a480031304fa7c251c70737b3f697a55156163"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.3.0/tailorctl_linux_v2.3.0_arm64.tar.gz"
      sha256 "3d756edfb81467ed40b35e8141bb02adbce40ba5fdb6707776b46c7360b0d33f"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.3.0/tailorctl_linux_v2.3.0_x86_64.tar.gz"
      sha256 "398db219ebc81e6075c39c3d15865e2fc74c5eec6edc3909b40e7567ebdc25f9"

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
