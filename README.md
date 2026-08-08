# Karabiner Vim Mode Plus

> **Maintenance Notice**
>
> This project is currently maintained by Mercas.
>
> The original author, Harm, no longer has access to a Mac and is therefore unable to test or maintain changes. I have taken over maintenance of this project to keep it working with current versions of macOS and Karabiner-Elements.
>
> Bug reports, improvements, and contributions are welcome.

<details>
<summary>Original maintainer's notice</summary>

> **Hi,**
>
> **I'm looking for someone who wants to maintain this mod, since I don't have a Mac anymore and therefore cannot test any changes. Please contact me if you're up for this.**
>
> **Harm**

</details>

A complex modification for [Karabiner-Elements](https://karabiner-elements.pqrs.org/) that mimics [Vim's navigation](https://vim.fandom.com/wiki/Moving_around) throughout your entire Mac.

## 1. So what do you get?

### 1.1 NORMAL mode

Activate with `Caps Lock`.

Deactivate with:

- `i` or `a` (there are more like these; see below)
- `Caps Lock`
- `Escape`
- `Enter`, which also sends an `Enter` key press
- `Control` + `[`
- Clicking any mouse button
- Pressing any key within Atom, iTerm2, PyCharm, or VSCodium (because those have their own Vim modes)
- Pressing any key while having at least one finger on your trackpad

Alternatively, you can hold `Caps Lock` for NORMAL mode and release it to exit.

Within NORMAL mode, you can move around with:

| Key | Action |
| --- | --- |
| `h` | Move cursor left* |
| `j` | Move cursor down* |
| `k` | Move cursor up* |
| `l` | Move cursor right* |
| `e` | Move cursor to next end of word |
| `b` | Move cursor to previous start of word |
| `0` | Move cursor to start of line (before any tabs) |
| `^` | Move cursor to start of line (after any tabs) |
| `$` | Move cursor to end of line |
| `;` | Move cursor to end of line |
| `g`, `g` | Move cursor to start of document |
| `G` | Move cursor to end of document |
| `{` | Move cursor to start of paragraph |
| `}` | Move cursor to end of paragraph |

\* These work with `Shift`, `Control`, `Option`, and/or `Command`, e.g. for hotkeys within apps.

Combine those with `d`, `y`, and `c` to delete ("cut"), yank ("copy"), or change ("cut" and exit NORMAL mode):

| Key | Action |
| --- | --- |
| `d`, `d` / `y`, `y` / `c`, `c` | Delete/yank/change the entire line |
| `d`, `e` / `y`, `e` / `c`, `e` | Delete/yank/change to the next end of word |
| `d`, `b` / `y`, `b` / `c`, `b` | Delete/yank/change to the previous start of word |
| ... | Ditto for all other navigation keys mentioned above |

Also:

| Key | Action |
| --- | --- |
| `x` | Delete forward |
| `X` | Delete back |
| `p` or `P` | Paste at cursor |
| `u` | Undo |
| `Control` + `r` | Redo |

To exit NORMAL mode at specific locations:

| Key | Action |
| --- | --- |
| `i` | Exit NORMAL mode at the cursor |
| `I` | Exit NORMAL mode at the start of the line |
| `a` | Exit NORMAL mode at the cursor |
| `A` | Exit NORMAL mode at the end of the line |
| `o` | Exit NORMAL mode on a new line below the cursor |
| `O` | Exit NORMAL mode on a new line above the cursor |

### 1.2 VISUAL mode

From within NORMAL mode, you can switch to VISUAL mode with `v`.

Unfortunately, you cannot switch to the other end of the selection with `o` as you normally would, so choose your starting point wisely.

| Key | Action |
| --- | --- |
| `v` | Exit VISUAL mode and enter NORMAL mode |
| `h` | Select left |
| `j` | Select down |
| ... | Ditto for all other navigation keys mentioned above |
| `d` | Delete ("cut") the selection and enter NORMAL mode |
| `y` | Yank ("copy") the selection and enter NORMAL mode |
| `c` | Change ("cut") the selection and exit Vim Mode entirely |
| `x` | Remove the selection and enter NORMAL mode |

## 2. Setting up

1. Install [Karabiner-Elements](https://karabiner-elements.pqrs.org/).

   Using Homebrew:

   ```bash
   brew install --cask karabiner-elements
   ```

2. Import this complex modification into Karabiner-Elements:

   [Import Karabiner Vim Mode Plus](karabiner://karabiner/assets/complex_modifications/import?url=https://git.sr.ht/~harmtemolder/karabiner-vim-mode-plus/blob/master/vim_mode_plus.json)

   You might have to copy and paste the link into your browser's address bar if your browser does not render it as a clickable link.

## 3. Making changes

The complex modifications are written in YAML and converted into JSON using `yml-to-json.py`.

You don't have to use YAML and can edit the JSON directly if you prefer.

Either way, after making changes, make sure to remove and re-add all parts of this mod in Karabiner-Elements' **Complex Modifications** tab.

The order of the modifications is important.

## 4. Contributing

Contributions are welcome!

If you'd like to contribute a bug fix, improvement, or new feature:

1. Fork this repository.
2. Create a new branch for your changes:

   ```bash
   git switch -c feature/my-change
   ```

3. Make your changes and test them with Karabiner-Elements.
4. Commit your changes with a clear and descriptive commit message.
5. Push the branch to your fork:

   ```bash
   git push -u origin feature/my-change
   ```

6. Open a [Pull Request](../../pulls) against this repository.

When submitting a pull request, please describe what the change does and, when applicable, how you tested it.

For larger changes or new features, consider opening an issue first to discuss the proposed approach.

## 5. Reporting issues

If you encounter a bug or unexpected behavior, please [open an issue](../../issues).

When reporting a bug, please include as much relevant information as possible, such as:

- Your macOS version
- Your Karabiner-Elements version
- The application where the issue occurs
- Steps to reproduce the issue
- Expected behavior
- Actual behavior
- Relevant Karabiner-Elements logs or configuration, if applicable

Feature requests and suggestions are also welcome through [GitHub Issues](../../issues).

Before opening a new issue, please check the existing issues to see whether the problem or suggestion has already been reported.

## 6. Changelog

### Maintained Version

#### Changed

- Replaced the original system notifications with Karabiner-Elements notifications.
  - NORMAL and VISUAL modes now display persistent notifications for as long as the corresponding mode is active.
  - This makes the current Vim mode continuously visible and improves situational awareness, addressing an issue with the original transient system notifications.

#### Removed

- Removed the Hammerspoon-specific key mappings:
  - `s` → `F18` — Hammerspoon screen modal
  - `m` → `F19` — Hammerspoon Markdown modal
  - `Space` → `F20` — Hammerspoon hyper modal

  These mappings were specific to the original maintainer's Hammerspoon configuration and are no longer included in the maintained version.

### Initial Release

Original version by Harm Temolder.

The initial release provided system-wide Vim-style NORMAL and VISUAL modes for Karabiner-Elements, including Vim-style navigation, editing operators, mode switching, system notifications, and optional Hammerspoon integration.
