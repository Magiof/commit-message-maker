### commit-message-maker

LLM 기반으로 Git 커밋 메시지를 제안하고, 선택하여 바로 커밋까지 도와주는 CLI입니다.

- **기본 명령어**: `commit-maker`
- **키 설정**: 불필요 (프록시 전용)
- **언어 선택**: 기본은 한국어, `-e`로 영어, `-k`로 한국어 고정

### 설치 (Homebrew)

```bash
brew tap Magiof/homebrew-commit-message-maker
brew install commit-message-maker
commit-maker -h
```

<!-- 개발 중에는 로컬 실행으로 테스트할 수 있습니다.

```bash
chmod +x bin/commit-maker
./bin/commit-maker -h
``` -->

### 사용법

메시지 생성 및 커밋

```bash
# 한국어(기본)
commit-maker

# 영어 메시지 생성
commit-maker -e

# 한국어 강제
commit-maker -k
```

- 현재 Git 저장소에서 스테이징된 변경을 분석합니다.
- LLM이 메시지를 3가지 버전으로 제안합니다: (1) 상세, (2) 간결, (3) 기능중심
- 번호(1/2/3) 입력 시 해당 메시지로 즉시 `git commit -m "..."` 실행합니다.


### 동작 방식

- `git diff --cached`로 스테이징 변경을 수집합니다.
- 프록시(Lambda)로 POST하여 3가지 메시지를 JSON으로 수신합니다.
- 선택한 메시지로 `git commit -m "..."`을 실행합니다.



### 문제 해결

- 스테이징된 변경이 없다는 메시지가 나오면 먼저 파일을 추가하세요:

```bash
git add .
```

- Git 저장소가 아니라면 초기화 후 진행하세요:

```bash
git init
```

- 네트워크 문제로 OpenAI API 오류가 발생할 수 있습니다. 잠시 후 재시도하세요.


### 문의

기능 제안/버그 제보 등은 GitHub Issue를 생성해 주세요. 기타 문의는 `tjddnjs7559@gmail.com`으로 메일을 보내주세요.

### 라이선스

MIT


