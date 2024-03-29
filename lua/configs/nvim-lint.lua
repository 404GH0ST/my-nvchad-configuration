local options = {
	javascript = { "biome" },
	json = { "biome" },
	typescript = { "biome" },
	c = { "cpplint" },
	cpp = { "cpplint" },
	docker = { "hadolint" },
	html = { "htmlint" },
	python = { "mypy", "ruff" },
	php = { "phpstan" },
	ansible = { "ansible_lint" },
	go = { "golangcilint" },
}

require("lint").linters_by_ft = options
