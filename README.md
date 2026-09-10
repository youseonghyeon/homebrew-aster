# Aster Homebrew Tap

[Aster](https://github.com/youseonghyeon/aster)의 개발자가 관리하는 개인 Homebrew Tap입니다. Homebrew 공식 Cask 저장소와는 별개입니다.

macOS 정식 Aster를 설치합니다. Apple Silicon과 Intel을 모두 포함하는 Universal DMG를 기존 GitHub Release에서 다운로드하고 SHA-256을 검증합니다. Dev·Preview는 포함하지 않습니다.

## 설치

Homebrew가 설치된 Mac에서 실행합니다.

```sh
brew install --cask youseonghyeon/aster/aster
```

또는 Tap을 먼저 등록할 수 있습니다.

```sh
brew tap youseonghyeon/aster
brew install --cask youseonghyeon/aster/aster
```

최신 Homebrew에서 `untrusted tap` 오류가 나타나면 저장소 주소가 `https://github.com/youseonghyeon/homebrew-aster`인지 확인한 뒤 이 Cask만 신뢰 등록하고 다시 실행합니다.

```sh
brew trust --cask youseonghyeon/aster/aster
brew install --cask youseonghyeon/aster/aster
```

`brew trust`가 없는 이전 Homebrew에서는 이 단계가 필요하지 않습니다. [Homebrew의 Tap 신뢰 안내](https://docs.brew.sh/Tap-Trust)를 참고하세요.

이미 수동 설치한 Aster가 있다면 그대로 앱 내 업데이트를 사용해도 됩니다. 위 명령은 기존 앱을 강제로 덮어쓰는 명령이 아니며, 기존 `/Applications/Aster.app` 때문에 설치가 중단될 수 있습니다.

## 업데이트

설치 후에도 Aster의 앱 내 업데이트를 사용할 수 있습니다. `auto_updates true`로 선언되어 일반적인 전체 `brew upgrade`에서는 기본적으로 제외됩니다.

Homebrew로 직접 업데이트하려면 Aster에서 작업을 저장하고 종료한 뒤 실행합니다.

```sh
brew update
brew upgrade --cask --greedy youseonghyeon/aster/aster
```

앱 내 업데이트와 Homebrew 업데이트를 동시에 실행하지 않습니다. Homebrew는 Tap에 기록된 버전을 기준으로 판단하므로 앱 내 업데이트 직후에는 기록된 버전과 실제 앱 버전이 다를 수 있습니다.

## 릴리스 관리

1. Aster 저장소의 정식 릴리스와 macOS Universal DMG 공개를 완료합니다.
2. 공개 DMG의 SHA-256을 확인하고 `Casks/aster.rb`의 `version`과 `sha256`을 함께 갱신합니다.
3. 아래 검사 후 변경을 게시합니다. Tap 버전 갱신은 현재 수동입니다.

```sh
brew style Casks/aster.rb
brew audit --cask --online youseonghyeon/aster/aster
brew fetch --cask youseonghyeon/aster/aster
```

`brew fetch`는 다운로드와 체크섬 검증만 수행하며 앱을 설치하지 않습니다. Tap을 별도로 clone해 수정했다면 `brew audit`와 `brew fetch`는 Homebrew에 등록된 Tap 사본을 읽는다는 점에 주의합니다. 게시 후 `brew update`로 갱신하거나 등록된 Tap에서 작업합니다.

Cask는 macOS 전용입니다. 1.9.1 앱의 `LSMinimumSystemVersion`은 10.13이지만 최신 Homebrew는 이 오래된 OS 의존성 선언을 허용하지 않아 별도로 선언하지 않습니다. Homebrew 자체의 지원 OS 조건이 적용되며, 앱의 최소 버전 표기는 해당 OS에서의 실기기 검증을 의미하지 않습니다.

향후 Homebrew 공식 Cask 등록은 별도 심사를 거쳐 진행합니다.
