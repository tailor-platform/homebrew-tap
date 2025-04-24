# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "1.32.1"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.32.1/tailorctl_darwin_v1.32.1_arm64.tar.gz"
      sha256 "7013b8b3329ed0b6ac44a1ef2e5c0e8a9ae3287c31805d949abb998a8beb05a9"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.32.1/tailorctl_darwin_v1.32.1_x86_64.tar.gz"
      sha256 "8cb3cd1c604de36b2793e991e0c88ba2f1f0af5cf14c1f56534ae8fe83671d9d"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.32.1/tailorctl_linux_v1.32.1_arm64.tar.gz"
      sha256 "7319324876a1c28fef9d872ef89953b92c072a9260d9ac9cc0c45deb5ca9ba96"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.32.1/tailorctl_linux_v1.32.1_x86_64.tar.gz"
      sha256 "d33cff50d935aea0e35b615ec9fbc6eeef61ff109c38eb63f306f8e829af7466"

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
