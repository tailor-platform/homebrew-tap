# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.7.5"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.7.5/tailorctl_darwin_v2.7.5_arm64.tar.gz"
      sha256 "bb56778f3a89359eda191690798e7acc1b6eb8e0bcc52b3caca9f6ac1e31e5cf"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.7.5/tailorctl_darwin_v2.7.5_x86_64.tar.gz"
      sha256 "9d5393c174df9113155dce647990f0789447940b5d577287043445ceaebe5bfd"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.7.5/tailorctl_linux_v2.7.5_arm64.tar.gz"
      sha256 "dd43135abc7d2b40bc453cc1b33351397647a78b73c2dc44eda9b884b87c55d1"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.7.5/tailorctl_linux_v2.7.5_x86_64.tar.gz"
      sha256 "5dc849f47942d843249a53b7482d8ee7423caf054f31563ddb7071caa92ec04b"

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
