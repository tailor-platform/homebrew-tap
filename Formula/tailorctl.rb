# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.4.0"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.4.0/tailorctl_darwin_v2.4.0_arm64.tar.gz"
      sha256 "70cbcdbf097777bb6510387e60ac70cb4593fab528c5d3e6482eb0cf9e39544d"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.4.0/tailorctl_darwin_v2.4.0_x86_64.tar.gz"
      sha256 "430e2e52783fb8016052a5c213148de8952af457e40d3be2d249eae76ca9a641"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.4.0/tailorctl_linux_v2.4.0_arm64.tar.gz"
      sha256 "749eb935e81bef892218ae933459e26abe4ca1902de3e9cc9c35b80471ecfcd9"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.4.0/tailorctl_linux_v2.4.0_x86_64.tar.gz"
      sha256 "eb4d2d847bf3db696cf16b7348295523263343c3dd0088844a2aa6bd08192019"

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
