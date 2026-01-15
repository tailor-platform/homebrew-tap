# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.8.11"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.11/tailorctl_darwin_v2.8.11_arm64.tar.gz"
      sha256 "790e5788511f2a5ed0db3d53b4c972c360f34d6ad00019d202573e45211b09af"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.11/tailorctl_darwin_v2.8.11_x86_64.tar.gz"
      sha256 "58c50ab57ef3eba1f5edf9a5e67bb11bba5d880131d095d930b4cf93cfee9485"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.11/tailorctl_linux_v2.8.11_arm64.tar.gz"
      sha256 "95058fc19364cfc8da0b025da1832040ac577c19971900c9101bbc8075308397"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.11/tailorctl_linux_v2.8.11_x86_64.tar.gz"
      sha256 "d32ded847426aa06edc14dd412b3351d9acf427647207e235f9466473c22273c"

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
