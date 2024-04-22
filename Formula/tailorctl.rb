# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "1.0.0"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.0.0/tailorctl_darwin_v1.0.0_arm64.tar.gz"
      sha256 "419b08b58b898308cfccd77f448568ecb2c64557b497063ef790987230be2beb"

      def install
        bin.install "tailorctl"
        bash_output = Utils.safe_popen_read(bin/"tailorctl", "completion", "bash")
        (bash_completion/"tailorctl").write bash_output
        zsh_output = Utils.safe_popen_read(bin/"tailorctl", "completion", "zsh")
        (zsh_completion/"tailorctl").write zsh_output
        fish_output = Utils.safe_popen_read(bin/"tailorctl", "completion", "fish")
        (fish_completion/"tailorctl.fish").write fish_output
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.0.0/tailorctl_darwin_v1.0.0_x86_64.tar.gz"
      sha256 "29f33c668f6a7883b36343fb3612b48fbdae7fe7ba84c6ad5b8a0fbed0d435b4"

      def install
        bin.install "tailorctl"
        bash_output = Utils.safe_popen_read(bin/"tailorctl", "completion", "bash")
        (bash_completion/"tailorctl").write bash_output
        zsh_output = Utils.safe_popen_read(bin/"tailorctl", "completion", "zsh")
        (zsh_completion/"tailorctl").write zsh_output
        fish_output = Utils.safe_popen_read(bin/"tailorctl", "completion", "fish")
        (fish_completion/"tailorctl.fish").write fish_output
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.0.0/tailorctl_linux_v1.0.0_arm64.tar.gz"
      sha256 "57249213d0833a24d41a147a2f8c18b2d20cb6a3167f2e0c2dddfaa88bdfdd7d"

      def install
        bin.install "tailorctl"
        bash_output = Utils.safe_popen_read(bin/"tailorctl", "completion", "bash")
        (bash_completion/"tailorctl").write bash_output
        zsh_output = Utils.safe_popen_read(bin/"tailorctl", "completion", "zsh")
        (zsh_completion/"tailorctl").write zsh_output
        fish_output = Utils.safe_popen_read(bin/"tailorctl", "completion", "fish")
        (fish_completion/"tailorctl.fish").write fish_output
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.0.0/tailorctl_linux_v1.0.0_x86_64.tar.gz"
      sha256 "831efc0bb82d30e752c63339648ecc136c5ebf2d2f217283c53bcac74234fa65"

      def install
        bin.install "tailorctl"
        bash_output = Utils.safe_popen_read(bin/"tailorctl", "completion", "bash")
        (bash_completion/"tailorctl").write bash_output
        zsh_output = Utils.safe_popen_read(bin/"tailorctl", "completion", "zsh")
        (zsh_completion/"tailorctl").write zsh_output
        fish_output = Utils.safe_popen_read(bin/"tailorctl", "completion", "fish")
        (fish_completion/"tailorctl.fish").write fish_output
      end
    end
  end

  test do
    system "#{bin}/tailorctl version"
  end
end
