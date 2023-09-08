# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https:/tailor.tech"
  version "0.5.17"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v0.5.17/tailorctl_darwin_v0.5.17_x86_64.tar.gz"
      sha256 "ed416fce6605f8c685255de4f491fce3a175f152c53a96b019963b0a77f33f95"

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
      url "https://github.com/tailor-platform/tailorctl/releases/download/v0.5.17/tailorctl_darwin_v0.5.17_arm64.tar.gz"
      sha256 "aa67d1d6f6e3561fa7a7000e50de19940e5d8af7e218371ccf73a01df291d941"

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
      url "https://github.com/tailor-platform/tailorctl/releases/download/v0.5.17/tailorctl_linux_v0.5.17_arm64.tar.gz"
      sha256 "9accbf4a645607ff351112a90ee6e0c60aea70f734c60ecbc0322e941e8dcd22"

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
      url "https://github.com/tailor-platform/tailorctl/releases/download/v0.5.17/tailorctl_linux_v0.5.17_x86_64.tar.gz"
      sha256 "e103fdcd7b12b821e0253a9251cf4100b318253216a76ba8b0cdd3f769cf705c"

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
