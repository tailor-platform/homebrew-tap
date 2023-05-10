# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https:/tailor.tech"
  version "0.0.3"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v0.0.3/tailorctl_darwin_v0.0.3_x86_64.tar.gz"
      sha256 "87d154d1543e798f0cf2f801036c3a35d5d8c7349b790966191a730ad3cbeeb8"

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
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v0.0.3/tailorctl_darwin_v0.0.3_arm64.tar.gz"
      sha256 "9a033d99185c98b5ce6861f24e4b156334f3dd07cbe106ac9128b934633ae43e"

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
      url "https://github.com/tailor-platform/tailorctl/releases/download/v0.0.3/tailorctl_linux_v0.0.3_arm64.tar.gz"
      sha256 "9b5da4edaa4c31f3873dff9eaa04b6fe4c18c60b8d917f1bc754ae80f5637b64"

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
      url "https://github.com/tailor-platform/tailorctl/releases/download/v0.0.3/tailorctl_linux_v0.0.3_x86_64.tar.gz"
      sha256 "87f09fb396c952b34a4cac68180f7fa9da455db6161f769495a8fdbfc0f9b9ab"

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
