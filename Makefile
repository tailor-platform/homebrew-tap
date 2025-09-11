depsdev:
	brew install Songmu/tap/maltmill

update-all:
	find Formula -type f -name '*.rb' | grep -v tailorctl | xargs -n 1 maltmill -w

.PHONY: depsdev update-all
