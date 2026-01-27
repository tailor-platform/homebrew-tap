# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.8.14"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.14/tailorctl_darwin_v2.8.14_arm64.tar.gz"
      sha256 "ea4522ab47f0faaeab7e84970d07af7338490aa58cf4e1aab3d4e805cd911493"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.14/tailorctl_darwin_v2.8.14_x86_64.tar.gz"
      sha256 "4000c5b2a47687f93887c5034c7e1d107b0c578e30a7d25aa1996f91c326db7c"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.14/tailorctl_linux_v2.8.14_arm64.tar.gz"
      sha256 "89662f0fa245778fe60459542d93f8520baa125f59cccfd52222bd06d481596f"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.14/tailorctl_linux_v2.8.14_x86_64.tar.gz"
      sha256 "30d2e25dacfea52926b6a692bb6ce593566ea6fc7b8deb9bc79c0345eec1efe0"

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
