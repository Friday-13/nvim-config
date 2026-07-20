# Neovim config

Конфигурация Neovim для повседневной разработки. Лёгкая, с ленивой загрузкой
плагинов, встроенным LSP (нативный API `vim.lsp.config`/`vim.lsp.enable` из
Neovim 0.11), автоустановкой тулчейна через **mason** и форматированием через
**conform.nvim**.

Поддерживаемые языки:

- **Python** — `basedpyright` (типы/hover) + `ruff` (линтинг/формат/сортировка импортов)
- **TypeScript / JavaScript / JSX / TSX** — `ts_ls` + `eslint` (диагностика/автофиксы) + `prettier`
- **HTML / CSS / SCSS** — `html-lsp`, `cssls`, `stylelint`, `emmet`, `prettier`
- **C / C++** — `clangd` + `clang-format`
- **Lua** — `lua_ls`
- **Markdown, YAML, JSON, TOML, Bash** — подсветка и форматирование

---

## Возможности (features)

### Ядро
- **Ленивая загрузка** — плагины грузятся через [`lazy.nvim`](https://github.com/folke/lazy.nvim) по событиям/командам/типам файлов; версии зафиксированы в `lazy-lock.json`. Исключение — `nvim-treesitter` (ветка `main` не поддерживает ленивую загрузку, грузится на старте).
- **Нативный LSP-стек** на API Neovim 0.11 (`vim.lsp.config` / `vim.lsp.enable`), без обёрток вроде `mason-lspconfig`.
- **Прозрачный фон** — [`nvim-transparent`](https://github.com/xiyaowong/nvim-transparent), включён по умолчанию (`vim.g.transparent_enabled = true`).
- **Тема** — `ayu` (dark) по умолчанию; `tokyonight-storm` в комплекте (переключается в `lua/colorschemes/`).

### Автоустановка инструментов
- [`mason.nvim`](https://github.com/williamboman/mason.nvim) + `mason-tool-installer` — при первом старте сами доустанавливают все LSP-серверы и форматтеры (`basedpyright`, `ruff`, `typescript-language-server`, `lua-language-server`, `html-lsp`, `css-lsp`, `stylelint-lsp`, `eslint-lsp`, `clangd`, `prettier`, `clang-format`). Ставить их руками не нужно.

### Автодополнение и подсказки
- [`blink.cmp`](https://github.com/saghen/blink.cmp) — автодополнение с Rust-матчером (собирается локально через `cargo`), встроенный signature help, документация в поповере. Popup не выскакивает сам — меню и справка вызываются по `<C-Space>` (повторное нажатие прячет документацию). Версия зафиксирована на коммите с поддержкой Neovim 0.12 (обработка `vim.NIL` в LSP-ответах); вернуть на релизный тег, когда выйдет релиз > 1.10.2 с поддержкой 0.12.

### Форматирование и линтинг
- [`conform.nvim`](https://github.com/stevearc/conform.nvim) — ручное форматирование по `<space>f` (Python → `ruff`, фронт → `prettier`, C → `clang-format`, для остального fallback на LSP). Автоформат на сохранение **выключен намеренно** (мешал бы авто-сохранению).
- **ESLint автофикс** всех проблем по `<space>ef`.
- [`auto-save.nvim`](https://github.com/Pocco81/auto-save.nvim) — авто-сохранение буфера (debounce 2 c) после выхода из insert / изменений.

### Навигация и редактирование
- [`telescope.nvim`](https://github.com/nvim-telescope/telescope.nvim) (+ `fzf-native`) — поиск файлов и live grep.
- [`treesitter`](https://github.com/nvim-treesitter/nvim-treesitter) (ветка `main` — для Neovim 0.11+/0.12) — подсветка и treesitter-отступы; парсеры доустанавливаются автоматически. Требует `tree-sitter-cli` для сборки парсеров. Инкрементальное выделение убрано (модуля нет на ветке `main`).
- [`vim-sneak`](https://github.com/justinmk/vim-sneak) — быстрые прыжки по двум символам (с метками).
- [`vim-surround`](https://github.com/tpope/vim-surround) — работа с окружениями (кавычки/скобки/теги).
- Встроенное комментирование Neovim 0.10+ (`gc`/`gcc`), плюс `gco`/`gcO` для паритета с Comment.nvim.
- `:Bclose` — закрыть буфер, не ломая раскладку окон.

### Инструменты под задачи
- [`vim-floaterm`](https://github.com/voldikss/vim-floaterm) — плавающий терминал.
- [`markdown-preview.nvim`](https://github.com/iamcco/markdown-preview.nvim) — превью Markdown в браузере.
- [`poetry-nvim`](https://github.com/karloskar/poetry-nvim) — авто-подхват venv из Poetry для Python.
- [`emmet-vim`](https://github.com/mattn/emmet-vim) — Emmet для HTML/JSX/CSS.
- [`log-highlight.nvim`](https://github.com/fei6409/log-highlight.nvim) — подсветка `.log`/`.out` и логов из `/var/log`, `logs/`.
- **Run file** — запуск текущего файла в сплит-терминале по `<C-h>` (Python / C `gcc % -o out && ./out` / Bash).

---

## Горячие клавиши (шпаргалка)

> Внимание к лидерам: в `user/keymaps.lua` лидер — **`,`** (запятая), а плагины
> используют **`<space>`** (пробел). Ниже указаны фактические клавиши.

### Навигация / файлы
| Клавиша | Действие |
|---|---|
| `,f` | Telescope: find files |
| `,g` | Telescope: live grep |
| `jk` (insert) | выход в normal (`<Esc>`) |
| `,<space>` | снять подсветку поиска |
| `H` / `L` | предыдущая / следующая вкладка |
| `gn` / `gp` | следующий / предыдущий буфер |
| `,bd` / `gw` | закрыть буфер (`:Bclose`) |

### LSP (в буфере с активным сервером)
| Клавиша | Действие |
|---|---|
| `gd` | к определению |
| `gD` | к определению в вертикальном сплите |
| `gi` | к реализации |
| `gr` | ссылки (Telescope) |
| `K` | hover-документация |
| `<C-k>` | signature help |
| `<space>rn` | переименовать символ |
| `<space>ca` | code action |
| `<space>D` | type definition |
| `<space>e` | показать диагностику в поповере |
| `[d` / `]d` | предыдущая / следующая диагностика |
| `<space>q` | диагностики в loclist |
| `<space>f` | форматировать буфер (conform) |
| `<space>ef` | ESLint: исправить всё (JS/TS) |

### TypeScript (ts_ls)
| Клавиша | Действие |
|---|---|
| `gs` | организовать импорты |
| `go` | добавить все импорты |
| `gi` | переименовать файл |

### Прочее
| Клавиша | Действие |
|---|---|
| `<C-h>` | сохранить и запустить текущий файл в терминале |
| `<C-Space>` | автодополнение: показать меню и справку (документацию) |

---

## Установка с нуля

Нужен **Neovim 0.11+** (используется новый LSP API); проверено на **0.12.4**.
Ветка `main` у `nvim-treesitter` и зафиксированная версия `blink.cmp` выбраны
именно ради совместимости с 0.12. Другие версии могут работать, но официально
не поддерживаются.

### 1. Системные зависимости

Нужны: **neovim ≥ 0.11**, **git**, **ripgrep** (live grep), **make** + **C-компилятор**
(сборка `fzf-native`), **tree-sitter-cli** ≥ 0.26.1 (сборка парсеров treesitter на
ветке `main`), **node + npm** (LSP-серверы и форматтеры фронтенда, markdown-preview),
**rust/cargo** (Rust-матчер `blink.cmp`). Плюс рантаймы языков, с которыми
работаете (Python и т.д.). Если `tree-sitter-cli` нет в пакетах вашей ОС —
`cargo install tree-sitter-cli` (cargo и так нужен для `blink.cmp`).

Остальные LSP-серверы и форматтеры ставить не нужно — их подтянет `mason`.

#### Manjaro / Arch
```sh
sudo pacman -S neovim git ripgrep make gcc nodejs npm rust tree-sitter-cli unzip
```

#### Ubuntu / Debian
В репозиториях Ubuntu Neovim часто старее 0.11 — берите свежий из PPA (или AppImage):
```sh
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim git ripgrep make gcc nodejs npm cargo unzip curl
cargo install tree-sitter-cli   # в apt пакета обычно нет
```
Проверьте версию: `nvim --version` должно показать `0.11+`. Если apt-версия
старая, используйте AppImage:
```sh
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim
```
Node в apt тоже бывает устаревшим — при проблемах ставьте LTS через
[NodeSource](https://github.com/nodesource/distributions) или `nvm`.

#### macOS ([Homebrew](https://brew.sh))
```sh
brew install neovim git ripgrep make node rust tree-sitter
```
(`clang`/`make` также приедут с Command Line Tools: `xcode-select --install`.)

### 2. Установка конфигурации

Забэкапьте существующий конфиг, если он есть:
```sh
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null || true
mv ~/.local/share/nvim ~/.local/share/nvim.bak 2>/dev/null || true
```

Склонируйте репозиторий в `~/.config/nvim`:
```sh
git clone <repo-url> ~/.config/nvim
```

### 3. Первый запуск

```sh
nvim
```

При первом старте автоматически произойдёт:
1. `lazy.nvim` склонирует и установит все плагины;
2. `blink.cmp` соберёт Rust-матчер (`cargo build --release`);
3. `mason` доустановит LSP-серверы и форматтеры (`ensure_installed`);
4. `treesitter` (ветка `main`) соберёт парсеры для нужных языков через `tree-sitter-cli`.

Дайте установке завершиться (может занять пару минут). Полезные проверки:

```
:Lazy        — статус плагинов
:Mason       — статус LSP/форматтеров
:checkhealth — общая диагностика окружения
```

Перезапустите Neovim после завершения установки — всё готово к работе.

---

## Структура конфигурации

```
~/.config/nvim
├── init.lua                 # точка входа: подключает user/*, lsp, lazy
├── lazy-lock.json           # зафиксированные версии плагинов
└── lua
    ├── user/                # опции, keymaps, bootstrap lazy, кастомные команды
    │   ├── options.lua      #   базовые vim.opt (табы, номера, прозрачность…)
    │   ├── keymaps.lua      #   глобальные горячие клавиши
    │   ├── lazy.lua         #   bootstrap lazy.nvim + mapleader
    │   ├── bclose.lua       #   команда :Bclose
    │   ├── run_file.lua     #   запуск файла по <C-h>
    │   └── custom-colors.lua#   цвета диагностик и Telescope
    ├── lsp/                 # конфиги LSP-серверов (нативный vim.lsp.config)
    │   ├── init.lua         #   подключает все серверы
    │   ├── default_on_attach.lua  # общие LSP-keymaps
    │   └── *.lua            #   basedpyright, ruff, ts_ls, clangd, lua, …
    ├── plugins/             # по файлу на плагин (спеки lazy.nvim)
    └── colorschemes/        # ayu (активна), tokyonight
```

### Как что настроить
- **Добавить плагин** — создайте файл в `lua/plugins/`, вернув спеку `lazy.nvim`.
- **Добавить LSP-сервер** — создайте `lua/lsp/<name>.lua` (`vim.lsp.config` + `vim.lsp.enable`), подключите в `lua/lsp/init.lua`, добавьте mason-пакет в `ensure_installed` (`lua/plugins/mason.lua`).
- **Форматтеры** — правьте `formatters_by_ft` в `lua/plugins/conform.lua`.
- **Сменить тему** — переключите `enabled` в файлах `lua/colorschemes/`.
- **Строгость типов Python** — `typeCheckingMode` в `lua/lsp/basedpyright.lua` (`standard` → `strict`).
