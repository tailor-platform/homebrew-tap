# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https:/tailor.tech"
  version "0.5.1"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v0.5.1/tailorctl_darwin_v0.5.1_x86_64.tar.gz"
      sha256 "2bb19e86227d81b88133f6d9a1571d43e4604ba54977c268011964d6b7d79f32"

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
      url "https://github.com/tailor-platform/tailorctl/releases/download/v0.5.1/tailorctl_darwin_v0.5.1_arm64.tar.gz"
      sha256 "a9e454fca76fc1ce59af812398ccffcc6fd8ed15cedf6dc49c19f23d33346229"

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
      url "https://github.com/tailor-platform/tailorctl/releases/download/v0.5.1/tailorctl_linux_v0.5.1_arm64.tar.gz"
      sha256 "94a7ae4a26f6227551a66f1a7410acb68455e1a169205306a4d5c93b8af0f19e"

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
      url "https://github.com/tailor-platform/tailorctl/releases/download/v0.5.1/tailorctl_linux_v0.5.1_x86_64.tar.gz"
      sha256 "fac7a8b2f8f0967cd1c483ff405fc541bfb5e6c762fb19b42808895df4710c24"

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
