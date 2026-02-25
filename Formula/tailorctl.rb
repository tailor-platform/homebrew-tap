# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.9.0"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.9.0/tailorctl_darwin_v2.9.0_arm64.tar.gz"
      sha256 "9a9ea974c4b95932831bb7f8f7cbe2838efe7bc31a46c53147cf88611fb69aa1"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.9.0/tailorctl_darwin_v2.9.0_x86_64.tar.gz"
      sha256 "103c9d6af349d3f637cf41841522162944294d46e7ae63076709f5d4a77ffb0c"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.9.0/tailorctl_linux_v2.9.0_arm64.tar.gz"
      sha256 "62e2c6fa15de6f124c184186597341ad250aaf342b2ff21358af62bc126eebd8"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.9.0/tailorctl_linux_v2.9.0_x86_64.tar.gz"
      sha256 "65a46a168c6e48ab8efa8d9eb389ee232e9126c859cc26bdfb330969b7d093c0"

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
