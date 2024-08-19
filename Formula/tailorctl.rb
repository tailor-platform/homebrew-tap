# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "1.12.0"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.12.0/tailorctl_darwin_v1.12.0_arm64.tar.gz"
      sha256 "b6415b529229867c89407e35fb2babbaa1217b351034f444c128ced5fbf4deb2"

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
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.12.0/tailorctl_darwin_v1.12.0_x86_64.tar.gz"
      sha256 "4366efda43f5a773e89f897b227ca6519b79ae6bdd43722b567627f9c21d100a"

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
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.12.0/tailorctl_linux_v1.12.0_arm64.tar.gz"
      sha256 "ac221ab8f24298e43d59bd044242df788d261bc461f350083f5ee24f5a72447f"

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
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.12.0/tailorctl_linux_v1.12.0_x86_64.tar.gz"
      sha256 "cb6c2aafff154e0acacaf8e7ec22818bbf97197bbf9f2ef8ae5e1ffde97190fd"

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
