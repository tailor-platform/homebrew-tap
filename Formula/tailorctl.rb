# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.10.1"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.10.1/tailorctl_darwin_v2.10.1_arm64.tar.gz"
      sha256 "7bfc4a0315c5235d9e3d4f1e45a2fcf37bda75a3f61ba796a8d1ada5c818028b"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.10.1/tailorctl_darwin_v2.10.1_x86_64.tar.gz"
      sha256 "5bc822ac7322d2ee451cee6b36fb4ce70fbff5277daa15c20ea3a174679a7ad2"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.10.1/tailorctl_linux_v2.10.1_arm64.tar.gz"
      sha256 "dde04505c229ef9c114eedd8f2075a07fb1b7550d6edd0b26f3449967eaf42d7"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.10.1/tailorctl_linux_v2.10.1_x86_64.tar.gz"
      sha256 "7d0f42ae7524718d1dba38378a1179d0977b23e863c68abe1ed4717bf30cc5c6"

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
