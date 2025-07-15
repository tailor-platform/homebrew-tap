# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "1.34.0"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.34.0/tailorctl_darwin_v1.34.0_arm64.tar.gz"
      sha256 "7b84b19d633f4076ad95d27d47f49d31b403abdc911efa3e561d7c0e9d59090a"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.34.0/tailorctl_darwin_v1.34.0_x86_64.tar.gz"
      sha256 "c35cf1777165b0e0bc9937c2360abfc65a68083adb3514c978263d6d58f5c0e5"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.34.0/tailorctl_linux_v1.34.0_arm64.tar.gz"
      sha256 "1252e54674f04cec36614f76714ba2d663b3406c8273dcb0865cd8532c9fdfff"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.34.0/tailorctl_linux_v1.34.0_x86_64.tar.gz"
      sha256 "d43d35722957d0bdc999a56171d161bf6fde6f4efdd0da4e2bb5eed67ad12dfe"

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
