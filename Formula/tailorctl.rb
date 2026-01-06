# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.8.9"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.9/tailorctl_darwin_v2.8.9_arm64.tar.gz"
      sha256 "13eb1d72bca16ac7c322058024df717694671a9de496eda3e255d3338c2201b4"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.9/tailorctl_darwin_v2.8.9_x86_64.tar.gz"
      sha256 "94aae117a8888915927a0067ebdcf1fdaf552b302bb885bd1aba49ec07c7feae"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.9/tailorctl_linux_v2.8.9_arm64.tar.gz"
      sha256 "aba810625f297ecde49c431bb42e6ca74bfdc7ecb161eee212afcb7f842751ae"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.9/tailorctl_linux_v2.8.9_x86_64.tar.gz"
      sha256 "15fdb6380183f1cdea4fc08c704d01c02e1f6ebeb5363932bab12620b96be75c"

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
