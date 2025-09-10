depsdev:
	brew install Songmu/tap/maltmill

update-all:
	grep -l darwin Formula/*.rb | grep -v tailorctl | xargs -n 1 maltmill -w

.PHONY: depsdev update-all
