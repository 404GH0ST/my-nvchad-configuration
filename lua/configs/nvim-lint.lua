local options = {
	javascript = { "biomejs" },
	json = { "biomejs" },
	typescript = { "biomejs" },
	c = { "cpplint" },
	cpp = { "cpplint" },
	java = { "checkstyle" },
	docker = { "hadolint" },
	html = { "htmlhint" },
	python = { "mypy", "ruff" },
	php = { "phpstan" },
	ansible = { "ansible_lint" },
	go = { "golangcilint" },
}

require("lint").linters_by_ft = options
