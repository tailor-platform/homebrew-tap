# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.5.1"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.5.1/tailorctl_darwin_v2.5.1_arm64.tar.gz"
      sha256 "c896b73c794bebaa249875c811347142c605d88b83c7e335899d040b240c8fda"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.5.1/tailorctl_darwin_v2.5.1_x86_64.tar.gz"
      sha256 "c5e1cdc8a7cf2f31f2f1cfb88d6b8966dcb10108765226f92650767277a55b20"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.5.1/tailorctl_linux_v2.5.1_arm64.tar.gz"
      sha256 "ad82234b1bb0d2cf61c424e14894f9194fdd2eef89d24780ef522ce8d2438d74"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.5.1/tailorctl_linux_v2.5.1_x86_64.tar.gz"
      sha256 "b735da31d4b31553cd318d0443ed981bf363cea50a338f8a1471cbf9626fcac4"

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
