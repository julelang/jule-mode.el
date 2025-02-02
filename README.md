# Jule for Emacs
Official [Jule](https://github.com/julelang/jule) mode for Emacs.

> [!WARNING]
> The mode is in early development stage and may not work as expected.
> Please check out the [TODO](#todo) section and report any issues you encounter.

___

- [Features](#features)
- [Installation](#installation)
<!--
- [Configuration](#configuration)
  - [Code formatting](#code-formatting)
-->
- [Development](#development)
  - [TODO](#todo)
- [Code of Conduct](#code-of-conduct)
- [License](#license)

___

## Features
- [x] Syntax highlighting (partial, see [TODO](#todo))
- [ ] Code formatting ([julefmt](https://github.com/julelang/julefmt))

## Installation
<!--
### MELPA
The package is available on [MELPA](https://melpa.org) and can be installed with:
```elisp
(setq package-archives '(("melpa" . "https://melpa.org/packages/")))
(package-initialize)
(package-refresh-contents)
```
<kbd>M-x</kbd> `package-install` <kbd>RET</kbd> `jule-mode` <kbd>RET</kbd>
-->

### Manual
1. Clone the repository:
```sh
git clone https://github.com/julelang/jule-mode.el.git
```
2. Add the following to your Emacs configuration:
```elisp
(add-to-list 'load-path "/path/to/jule-mode.el")
(require 'jule-mode)
```

<!--
## Configuration
### Code formatting
-->

## Development
### TODO
- string escape sequences highlighting
- comments highlighting
- operator highlighting
- delimiter highlighting

## Code of Conduct
See the [Julenour Code of Conduct](https://jule.dev/code-of-conduct)

## License
The extension is distributed under the terms of the BSD 3-Clause license. <br>
[See License Details](/LICENSE)
