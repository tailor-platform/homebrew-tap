# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.8.0"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.0/tailorctl_darwin_v2.8.0_arm64.tar.gz"
      sha256 "23c42b2c067ea94fdf851a90f25ac18874533cfbc73a226ce4fe81abf183ad92"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.0/tailorctl_darwin_v2.8.0_x86_64.tar.gz"
      sha256 "116422ea2bbe04d809265f8ae5548568f82ce869f9429a0949fd41b5b0124d3a"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.0/tailorctl_linux_v2.8.0_arm64.tar.gz"
      sha256 "390a51dc7df944b9f1b222c9feb0a438834cd866ef2b177eb6053465ac12c375"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.0/tailorctl_linux_v2.8.0_x86_64.tar.gz"
      sha256 "7b4882c5cda4d0ee6d8acb97857e809eef265fd63c429a90fe069281aeb4b4d3"

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
