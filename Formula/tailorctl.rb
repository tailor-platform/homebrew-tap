# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https:/tailor.tech"
  version "0.0.1"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v0.0.1/tailorctl_darwin_v0.0.1_x86_64.tar.gz"
      sha256 "98bf7f64d397f1da3599fa9da78718b5e220d83bda566b2a80fc653874e84c2b"

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
      url "https://github.com/tailor-platform/tailorctl/releases/download/v0.0.1/tailorctl_darwin_v0.0.1_arm64.tar.gz"
      sha256 "95b71dd428ad4886abcb0e74fa72dcfcfff28da51e34ab5ca88dc2a93b17fc58"

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
      url "https://github.com/tailor-platform/tailorctl/releases/download/v0.0.1/tailorctl_linux_v0.0.1_arm64.tar.gz"
      sha256 "be4bc9bea7002cf71de2c811b924e6dab950b9d0144f9eb1ccd115cc31039cdf"

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
      url "https://github.com/tailor-platform/tailorctl/releases/download/v0.0.1/tailorctl_linux_v0.0.1_x86_64.tar.gz"
      sha256 "887737e38978113c3ced6b8363e01f05fe25d074306dcb32ccd03e0dcc74badf"

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
