# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "1.8.6"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.8.6/tailorctl_darwin_v1.8.6_arm64.tar.gz"
      sha256 "e4d0b6e96b9293e13c17592268f5c0e058dcfdbefef5b293fb0bcf75e295f700"

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
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.8.6/tailorctl_darwin_v1.8.6_x86_64.tar.gz"
      sha256 "ff84b23ca68804a3ddb87a08b957ec1e12846908202a1da8b14da8d75ef7857c"

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
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.8.6/tailorctl_linux_v1.8.6_arm64.tar.gz"
      sha256 "9d0bfca73e071d0d3cd07b90b1723489bad8b18d9b95ba1fe0d0ffbb7f1c5841"

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
      url "https://github.com/tailor-platform/tailorctl/releases/download/v1.8.6/tailorctl_linux_v1.8.6_x86_64.tar.gz"
      sha256 "0d1f6116c10bd84a8ee9e51ad39d97870205bbe2304ac9036640aeb12c26d6e8"

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
