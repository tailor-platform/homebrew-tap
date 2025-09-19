# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.5.0"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.5.0/tailorctl_darwin_v2.5.0_arm64.tar.gz"
      sha256 "90df7068c4fc3b30c79d80b2346e3760c4380fd1aad4a9c10162405d0ef9123d"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.5.0/tailorctl_darwin_v2.5.0_x86_64.tar.gz"
      sha256 "125683b35f07c08c9cf2df62ed47c6d5bdeafdf4057bcf0f0fc41b7f8c421257"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.5.0/tailorctl_linux_v2.5.0_arm64.tar.gz"
      sha256 "a870e6e681af22ba2add97cc8011de650ea273dc171e0202dfd20353263dde8a"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.5.0/tailorctl_linux_v2.5.0_x86_64.tar.gz"
      sha256 "20044cd1f106123d5217848de8953b45c1d7a326ddc585ab1e541fa272da3b1d"

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
