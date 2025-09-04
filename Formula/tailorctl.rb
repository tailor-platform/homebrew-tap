# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.4.2"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.4.2/tailorctl_darwin_v2.4.2_arm64.tar.gz"
      sha256 "1e3a003043f25a18742bca13c16f22a28a0a5b4b3d6a229bc7e2a4626ba35dad"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.4.2/tailorctl_darwin_v2.4.2_x86_64.tar.gz"
      sha256 "8fddb266a4f9dbc76508a4c14431e48faf1beb9e2eef3918bda1186c25434c61"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.4.2/tailorctl_linux_v2.4.2_arm64.tar.gz"
      sha256 "d0bf7a273f22ba75ce63224367df4e042d0f80988d9ece76777a2b9f8cca8e12"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.4.2/tailorctl_linux_v2.4.2_x86_64.tar.gz"
      sha256 "3c255aa489b040c67982119bb6099b5d78b0f36f61bcd79404becb1605a8ff5f"

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
