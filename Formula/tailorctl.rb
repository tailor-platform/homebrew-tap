# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.8.1"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.1/tailorctl_darwin_v2.8.1_arm64.tar.gz"
      sha256 "0d5bcd92fb82d69979980da1620763ccb901b26f43f82a77c4eaba95b182c482"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.1/tailorctl_darwin_v2.8.1_x86_64.tar.gz"
      sha256 "1cb618b519519afc1cf1623d0a64ba7c235e2aaf404af9b68502e642ff1d64ba"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.1/tailorctl_linux_v2.8.1_arm64.tar.gz"
      sha256 "a2b062f075c0933437d11456173390e497d38bc690deb270fb460bf38bcb39b3"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.1/tailorctl_linux_v2.8.1_x86_64.tar.gz"
      sha256 "595279863ec01e5e92c4a75b4000a4f525308ba6b926563393b553b00b698708"

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
