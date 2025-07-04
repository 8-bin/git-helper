# Git 자동화 도우미 📚

팀원들을 위한 Git 사용 자동화 스크립트입니다. 복잡한 Git 명령어를 몰라도 쉽게 버전 관리를 할 수 있습니다!

## 🎯 이 도구로 할 수 있는 것들

- ✅ 새 작업 시작 (브랜치 생성)
- ✅ 작업 저장 (add + commit + push 한번에!)
- ✅ 최신 코드 받기
- ✅ 브랜치 전환하기
- ✅ 현재 상태 확인하기
- ✅ Pull Request 준비하기

## 🚀 Windows + VSCode에서 설정하기

### 1단계: Git Bash 설치 확인

**Git이 설치되어 있는지 확인하세요:**
1. `Windows + R` 키를 누르고 `cmd` 입력 후 Enter
2. `git --version` 입력
3. 버전이 나오면 OK! 안 나오면 [Git 공식 사이트](https://git-scm.com/)에서 다운로드

### 2단계: VSCode에서 터미널 설정

**VSCode에서 Git Bash를 기본 터미널로 설정:**

1. VSCode를 열고 `Ctrl + Shift + P` 누르기
2. `Terminal: Select Default Profile` 검색 후 선택
3. `Git Bash` 선택 (없으면 `Command Prompt`도 괜찮습니다)

### 3단계: 스크립트 파일 생성

**프로젝트 폴더에 스크립트 만들기:**

1. VSCode에서 프로젝트 폴더 열기
2. 프로젝트 루트에 `git-helper.sh` 파일 새로 만들기
3. 여기 있는 스크립트 코드 전체 복사해서 붙여넣기
4. `Ctrl + S`로 저장

### 4단계: 실행하기

**VSCode 터미널에서 실행:**

1. VSCode에서 `Ctrl + `` (백틱) 누르거나 상단 메뉴 `View > Terminal`
2. 터미널에서 다음 명령어 입력:

```bash
# 실행 권한 부여 (최초 1회만)
chmod +x git-helper.sh

# 스크립트 실행
./git-helper.sh
```

## 💻 사용법 (단계별 가이드)

### 🆕 새로운 기능 개발을 시작할 때

1. 스크립트 실행: `./git-helper.sh`
2. `1번` 선택 (새 작업 시작하기)
3. 브랜치 이름 입력 (예: `feature/login` 또는 `fix/button-bug`)
4. 자동으로 최신 코드를 받고 새 브랜치가 생성됩니다!

### 💾 작업 중간중간 저장할 때

1. 스크립트 실행: `./git-helper.sh`
2. `2번` 선택 (작업 저장하기)
3. 커밋 메시지 입력 (예: "로그인 폼 UI 완성")
4. 자동으로 GitHub에 저장됩니다!

### 🔄 다른 팀원의 최신 코드 받기

1. 스크립트 실행: `./git-helper.sh`
2. `3번` 선택 (최신 코드 받기)
3. 자동으로 최신 변경사항이 적용됩니다!

### ✅ 기능 개발 완료 후 Pull Request 만들기

1. 스크립트 실행: `./git-helper.sh`
2. `7번` 선택 (작업 완료하기)
3. 마지막 저장 후 PR 링크가 나타납니다
4. 링크를 클릭해서 GitHub에서 PR 생성!

## 🔧 문제 해결

### "Permission denied" 에러가 날 때
```bash
# Git Bash에서 실행 권한 다시 부여
chmod +x git-helper.sh
```

### "command not found" 에러가 날 때
```bash
# 현재 위치 확인
pwd

# 스크립트 파일이 있는지 확인
ls -la git-helper.sh

# 있다면 다음처럼 실행
bash git-helper.sh
```

### VSCode 터미널이 PowerShell일 때
```powershell
# PowerShell에서는 이렇게 실행
bash git-helper.sh
```

## 📋 일반적인 작업 흐름

```
1️⃣ 새 작업 시작 → 2️⃣ 코딩 → 2️⃣ 저장 → 2️⃣ 코딩 → 2️⃣ 저장 → 7️⃣ 작업 완료 → GitHub에서 PR 생성
```

## ⚠️ 주의사항

- **항상 프로젝트 루트 폴더에서 실행**하세요
- **브랜치 이름**은 영어로, 슬래시(/)나 하이픈(-)을 사용해주세요
  - 좋은 예: `feature/user-login`, `fix/header-bug`
  - 나쁜 예: `내 작업`, `test123`
- **커밋 메시지**는 무엇을 했는지 간단히 적어주세요
  - 좋은 예: "로그인 버튼 스타일 수정", "회원가입 API 연동"
  - 나쁜 예: "수정", "ㅇㅇ"

## 🆘 도움이 필요할 때

1. **스크립트 메뉴에서 `6번`**을 선택하면 현재 상태를 확인할 수 있습니다
2. **문제가 생기면** 팀 리더에게 다음 정보와 함께 연락하세요:
   - 어떤 작업을 하려고 했는지
   - 어떤 에러 메시지가 나왔는지
   - `git status` 명령어 결과

## 🎉 Git 없이도 쉽게!

이제 복잡한 Git 명령어를 외울 필요 없이, 번호만 선택하면 모든 버전 관리가 자동으로 됩니다!

---

💡 **팁**: 이 README를 즐겨찾기에 추가해두고 필요할 때마다 참고하세요!
