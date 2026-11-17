# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.16.2"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.16.2/tailorctl_darwin_v2.16.2_arm64.tar.gz"
      sha256 "433c1bc18c1d55378d8cae08b08fcb922ac9bcc8aee12d3605cc4c0d997c81cf"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.16.2/tailorctl_darwin_v2.16.2_x86_64.tar.gz"
      sha256 "01eb0f66471736347a3b85f20b3160e4e05bff8e5787a7fbf90b7ee56499eaa8"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.16.2/tailorctl_linux_v2.16.2_arm64.tar.gz"
      sha256 "3a6c7208aca4033505a954dbdc0af2a7187a941415c0910d85cd82061856c8cf"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.16.2/tailorctl_linux_v2.16.2_x86_64.tar.gz"
      sha256 "7061846923f72d968b9486e990ef48e4ca8b5c07edfaea21f29ffb8256ac52bf"

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
