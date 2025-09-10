# Commit Message Maker

AI 기반 Git 커밋 메시지 생성 도구입니다. 스테이징된 변경 사항을 분석하고 OpenAI GPT 모델을 이용해 [Conventional Commits](https://www.conventionalcommits.org/) 형식의 메시지를 자동으로 작성한 뒤 `git commit`을 실행합니다.

## 준비 사항

- **Python 3.8+**
- **openai** 라이브러리 (`pip install openai`)
- **OPENAI_API_KEY** 환경 변수에 OpenAI API 키 설정

```bash
# 예시
pip install openai
export OPENAI_API_KEY="sk-..."
```

## 사용 방법

1. 변경 파일을 스테이징합니다.
   ```bash
   git add <파일 경로>
   ```
2. 스크립트를 실행합니다.
   ```bash
   ./make_commit [옵션]
   ```
   실행 후 생성된 메시지로 자동으로 커밋이 생성되고, 커밋 메시지가 화면에 출력됩니다.

### 옵션

| 옵션 | 설명 |
|------|------|
| `-e` | 커밋 메시지를 **영어**로 생성합니다. |
| `-k` | 커밋 메시지를 **한국어**로 생성합니다. (기본값) |

옵션을 생략하면 한국어 메시지가 생성됩니다.

## 예시
```bash
export OPENAI_API_KEY="sk-..."
git add README.md
./make_commit -e
```

## 동작 원리
- 스테이징된 파일의 변경 사항을 `git diff --cached`로 확인합니다.
- 각 파일별 추가/삭제 라인 수와 총합을 OpenAI API에 전달하여 커밋 메시지를 생성합니다.
- 생성된 메시지를 이용해 `git commit -m`을 실행합니다.

## 라이선스

이 프로젝트는 [MIT License](LICENSE)를 따릅니다.
