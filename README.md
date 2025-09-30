### commit-message-maker

LLM 기반으로 Git 커밋 메시지를 제안하고, 선택하여 바로 커밋까지 도와주는 CLI입니다.

- **기본 명령어**: `commit-maker`
- **키 설정**:
  - 추천: 서버 프록시 사용 `COMMIT_MAKER_PROXY_URL=https://your-proxy/commit-message`
  - 또는 로컬 환경변수 `export GROQ_API_KEY=...`
- **언어 선택**: 기본은 한국어, `-e`로 영어, `-k`로 한국어 고정

### 설치 (Homebrew)

배포 완료 후 아래와 같이 설치합니다.

```bash
brew tap <YOUR_GITHUB_USERNAME>/commit-message-maker
brew install commit-message-maker
```

개발 중에는 로컬 실행으로 테스트할 수 있습니다.

```bash
chmod +x bin/commit-maker
./bin/commit-maker -h
```

### 사용법

1) 최초 설정 (OpenAI Key 저장)

```bash
# 키 없이 프록시 사용(권장)
export COMMIT_MAKER_PROXY_URL=https://your-proxy/commit-message

# 로컬 키 사용(대안)
export GROQ_API_KEY=YOUR_KEY
```

2) 메시지 생성 및 커밋

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

### 환경 변수

- `COMMIT_MAKER_PROXY_URL`: 프록시 엔드포인트(설정 시 키 불필요)
- `GROQ_API_KEY`: Groq API 키(프록시 미사용 시 필요)
- `GROQ_API_BASE`: 기본 `https://api.groq.com/openai` (필요 시 변경)
- `COMMIT_MAKER_MODEL`: 사용할 모델(ID). 기본: `llama-3.1-8b-instant`

### 동작 방식

- `git diff --cached`로 스테이징 변경을 수집합니다.
- OpenAI Chat Completions API로 3가지 메시지를 JSON으로 요청합니다.
- 선택한 메시지로 `git commit -m "..."`을 실행합니다.

### Homebrew 배포 가이드 (요약)

1. GitHub Release를 생성하고 아티팩트(tar/zip)를 올립니다.
2. `HomebrewFormula/commit-message-maker.rb`의 `url`, `sha256`, `version`을 업데이트합니다.
3. 사용자 설치 안내:

```bash
brew tap <YOUR_GITHUB_USERNAME>/commit-message-maker
brew install commit-message-maker
```

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

### 라이선스

MIT


