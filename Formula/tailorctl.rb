# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.10.0"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.10.0/tailorctl_darwin_v2.10.0_arm64.tar.gz"
      sha256 "c70230b77d51acc42521ae08754f607e84f3fee9302a50fd9c61d78d9a7a768c"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.10.0/tailorctl_darwin_v2.10.0_x86_64.tar.gz"
      sha256 "1ef083f13b28e36c7725122c8418a5e1f5b4f8eaab10a6d96b04e961eeeb4136"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.10.0/tailorctl_linux_v2.10.0_arm64.tar.gz"
      sha256 "0599979e546bdee3ba3c25dfd176a42b8b079621868f0ddef6c6e31732b468c1"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.10.0/tailorctl_linux_v2.10.0_x86_64.tar.gz"
      sha256 "c782833fc98e1b5d54e107315cedac91ed9230c94c998c939992588fdfdc790c"

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
