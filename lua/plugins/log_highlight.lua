return {
    "fei6409/log-highlight.nvim",
    opts = {
        extension = { "log", "out" },

        pattern = {
            "/var/log/.*",
            "logs/.*",
        },

        keyword = {
            error = {"ERROR", "FATAL", "PANIC"},
            warning = {"WARN"},
            info = {"INFO"},
            debug = {"DEBUG"},
        },
    },
}
