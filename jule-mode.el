
;;; jule-mode.el --- Official Jule mode for Emacs

;; Author: Adam Perkowski <adas1per@protonmail.com>
;; Version: 0.0.1
;; Keywords: languages
;; URL: https://github.com/julelang/jule-mode.el
;; Package-Requires: ((emacs "29.4"))

;; This file is distributed under the terms of the BSD 3-Clause License.
;; See the LICENSE file for details.
;; It is not part of GNU Emacs.

;;; Commentary:

;; This package provides a major mode for editing Jule code.

;;; Code:
(defconst jule-keywords
  '("chan" "map" "error" "use" "fn" "struct" "byte" "rune" "enum" "unsafe"
    "let" "match" "defer" "if" "else" "for" "in" "impl" "trait" "break"
    "continue" "goto" "cpp" "type" "ret" "fall" "co" "let" "select"))

(defconst jule-types
  '("int" "uint" "uintptr" "i8" "i16" "i32" "i64" "u8" "u16" "u32" "u64" "f32" "f64" "bool" "str" "any" "byte" "rune"))

(defconst jule-storage
  '("static" "const" "mut" "self"))

(defconst jule-constants
  '("true" "false" "nil"))

(defvar jule-font-lock-keywords
  (append
   `(
     ;; directives (e.g. `#pass`)
     ;; regex: a `#` followed by a sequence of word characters
     (,(rx bol "#" (1+ word)) . font-lock-preprocessor-face)

     ;; code keywords
     (,(regexp-opt jule-keywords 'symbols) . font-lock-keyword-face)

     ;; type keywords
     (,(regexp-opt jule-types 'symbols) . font-lock-type-face)

     ;; storage keywords
     (,(regexp-opt jule-storage 'symbols) . font-lock-keyword-face)

     ;; constants
     (,(regexp-opt jule-constants 'symbols) . font-lock-constant-face)

     ;; function names
     ;; regex: a word followed by either `(` or `[`, but not including `(` or `[`
     (,(rx word-start (group (1+ word)) word-end (0+ space) "(") 1 font-lock-function-name-face)
     (,(rx word-start (group (1+ word)) (0+ space) "[" (0+ nonl) "]" (0+ space) "(") 1 font-lock-function-name-face)

     ;; numbers
     ;; regex: regex: a sequence of 0 or 1 digits starting with `0b`, possibly separated by `_`
     (,(rx word-start "0b" (group (1+ (or "0" "1" "_"))) word-end) . font-lock-constant-face)
     ;; regex: regex: a sequence of 0-7 digits starting with `0o`, possibly separated by `_`
     (,(rx word-start "0o" (group (1+ (or (any "0-7") "_"))) word-end) . font-lock-constant-face)
     ;; regex: a sequence of 0-9 digits and letters `a-f` or `A-F` starting with `0x`
     (,(rx word-start "0x" (group (1+ (or (or any "0-9" "a-f" "A-F") "_"))) word-end) . font-lock-constant-face)
     ;; regex: a sequence of digits, possibly separated by `_`, followed by a dot,
     ;; followed by a sequence of digits, possibly separated by `_`, followed by an
     ;; optional exponent (e.g. `123.456`, `123_456.789`, `123.456e789`, `123.456e+789`)
     (,(rx word-start
           (group (1+ (or digit "_")) (opt (seq "." (1+ (or digit "_")))))
           (opt (seq (any "eE") (opt (any "-+")) (1+ digit)))
           word-end)
      . font-lock-constant-face)

     ;; strings
     ;; regex: a sequence of characters enclosed in single quotes
     (,(rx "'" (group (0+ (not (any "'")))) "'") . font-lock-string-face)
     ;; regex: a sequence of characters enclosed in double quotes
     (,(rx "\"" (group (0+ (not (any "\"")))) "\"") . font-lock-string-face)
     ;; regex: a sequence of characters enclosed in backticks
     (,(rx "`" (group (0+ (not (any "`")))) "`") . font-lock-string-face)
     )))

(define-derived-mode jule-mode prog-mode "jule"
  "Major mode for editing Jule code."
  (setq indent-tabs-mode t)
  (setq font-lock-defaults '(jule-font-lock-keywords)))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.jule\\'" . jule-mode))

(provide 'jule-mode)
