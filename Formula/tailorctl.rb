# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.7.4"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.7.4/tailorctl_darwin_v2.7.4_arm64.tar.gz"
      sha256 "fd2d56c74511b1154c38aa42e37613ee4855709944d9623ec67a896af23c4aae"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.7.4/tailorctl_darwin_v2.7.4_x86_64.tar.gz"
      sha256 "f981d8196dc54c76ccb422aa5cb15b71ff334874ccbfe812f339bde505137111"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.7.4/tailorctl_linux_v2.7.4_arm64.tar.gz"
      sha256 "0e352ad2ffb8fb5be143e4976c9959b469afcec1eaf67ec108162cc2edab02a8"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.7.4/tailorctl_linux_v2.7.4_x86_64.tar.gz"
      sha256 "3de9d0d8996e65d47a0a335ca18792ce031aac083f2bb7c267f8028e6139ef40"

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
