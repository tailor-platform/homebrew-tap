# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.8.5"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.5/tailorctl_darwin_v2.8.5_arm64.tar.gz"
      sha256 "9e2ec8b3edad250d016402d3b7c922057e9584f4995f79d1e2bbd72546be6fcd"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.5/tailorctl_darwin_v2.8.5_x86_64.tar.gz"
      sha256 "3f28dd9214f94b6cb8ee50da8e9667dfbaa62a4780bbce4debe207bc88d39f59"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.5/tailorctl_linux_v2.8.5_arm64.tar.gz"
      sha256 "352e1764a26c9b72a8b0e98ed03a0726542cea9a4d67f8a59912871f5553d161"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.5/tailorctl_linux_v2.8.5_x86_64.tar.gz"
      sha256 "d83040397f8e500c87f5e2ad5283281d914395fdc29c3734a4ee4ae39cbad92d"

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
