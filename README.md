# Aster Homebrew Tap

Install [Aster](https://github.com/youseonghyeon/aster), a Markdown desktop reader, with Homebrew.

This tap is maintained by Aster's developer and is separate from the official Homebrew Cask repository. It distributes the stable macOS app as a Universal DMG for Apple Silicon and Intel, downloaded from Aster's GitHub Releases and verified with SHA-256. Dev and Preview builds are not included.

## Install

With Homebrew installed, run:

```sh
brew install --cask youseonghyeon/aster/aster
```

Alternatively, add the tap first and use the short name:

```sh
brew tap youseonghyeon/aster
brew install --cask aster
```

If Homebrew reports an `untrusted tap` error, verify that the repository is `https://github.com/youseonghyeon/homebrew-aster`, then trust this cask and retry:

```sh
brew trust --cask youseonghyeon/aster/aster
brew install --cask youseonghyeon/aster/aster
```

Older Homebrew versions without `brew trust` do not need this step. See [Homebrew's tap trust documentation](https://docs.brew.sh/Tap-Trust).

If you installed Aster manually, you can continue using its in-app updater. Homebrew installation may stop if `/Applications/Aster.app` already exists; these commands do not force an existing app to be replaced.

## Update

Aster's in-app updater remains available after installation through Homebrew. The cask declares `auto_updates true`, so a general `brew upgrade` skips it by default.

To update through Homebrew, save your work and quit Aster, then run:

```sh
brew update
brew upgrade --cask --greedy youseonghyeon/aster/aster
```

Do not run the in-app updater and a Homebrew upgrade at the same time. Homebrew tracks the version recorded by its installation, which may differ from the running app's version after an in-app update.

## Maintain a release

1. Publish the stable Aster release and its macOS Universal DMG in the Aster repository.
2. Verify the published DMG's SHA-256 and update both `version` and `sha256` in `Casks/aster.rb`.
3. Run the checks below and publish the change. Tap version updates are currently manual.

```sh
brew style Casks/aster.rb
brew audit --cask --online youseonghyeon/aster/aster
brew fetch --cask youseonghyeon/aster/aster
```

`brew fetch` downloads and verifies the archive without installing the app. If you edit a separate clone, remember that `brew audit` and `brew fetch` read Homebrew's registered copy of the tap. Work in that copy, or refresh it with `brew update` after publishing and verify the published version.

The cask is macOS-only. Aster 1.9.1 declares `LSMinimumSystemVersion` as 10.13, but current Homebrew no longer accepts that old macOS dependency declaration, so the cask does not specify it. Homebrew's own OS support requirements still apply. The app's declared minimum version does not imply testing on that OS.

Submission to the official Homebrew Cask repository will be considered separately and is subject to review.

## Contributing

Use English for documentation, code comments, commit titles and bodies, pull requests, and issue descriptions in this repository. Use lowercase Conventional Commit titles, such as `docs(readme): clarify installation instructions`.

This convention applies to this tap; the Aster application repository maintains its own language conventions.
