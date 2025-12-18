# typed: false
# frozen_string_literal: true

class Tailorctl < Formula
  desc "Command line tool for Tailor Platform'"
  homepage "https://tailor.tech"
  version "2.8.6"

  depends_on "cue" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.6/tailorctl_darwin_v2.8.6_arm64.tar.gz"
      sha256 "dc4b1da770f313565d16591295b5ff41ffdb40a7d4fe98de266d5dfc4370f2f0"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.6/tailorctl_darwin_v2.8.6_x86_64.tar.gz"
      sha256 "eebb637538cfd0c616fa8d5d5d7d90613054f7f6fb02927f54dae273dc041f6c"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.6/tailorctl_linux_v2.8.6_arm64.tar.gz"
      sha256 "92d4f92f98d8cadb89fb13ba85317cf2ec450f278b36d7672e7f877a9113e90b"

      def install
        bin.install "tailorctl"
        generate_completions_from_executable(bin/"tailorctl", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tailor-platform/tailorctl/releases/download/v2.8.6/tailorctl_linux_v2.8.6_x86_64.tar.gz"
      sha256 "eb6b426532a5704051e4caba26bed06ea93173063bd89d1da4d8377d6cc79557"

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
