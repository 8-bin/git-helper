#!/bin/bash

# ===========================================
# Git 자동화 스크립트 모음
# 팀원들이 쉽게 사용할 수 있는 Git 명령어들
# ===========================================

# 색상 정의
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 로고 출력
print_logo() {
    echo -e "${BLUE}"
    echo "=================================="
    echo "    Git 자동화 도우미 🚀"
    echo "=================================="
    echo -e "${NC}"
}

# 1. 새 작업 시작하기
start_new_work() {
    echo -e "${YELLOW}새 작업을 시작합니다...${NC}"
    
    # 최신 코드 받기
    echo "최신 코드를 받아오는 중..."
    git checkout main
    git pull origin main
    
    # 브랜치 이름 입력받기
    read -p "브랜치 이름을 입력하세요 (예: feature/login): " branch_name
    
    if [ -z "$branch_name" ]; then
        echo -e "${RED}브랜치 이름을 입력해야 합니다!${NC}"
        return
    fi
    
    # 새 브랜치 생성 및 전환
    git checkout -b "$branch_name"
    
    echo -e "${GREEN}✅ 새 브랜치 '$branch_name'에서 작업을 시작할 준비가 되었습니다!${NC}"
}

# 2. 작업 저장하기
save_work() {
    echo -e "${YELLOW}작업을 저장합니다...${NC}"
    
    # 현재 브랜치 확인
    current_branch=$(git branch --show-current)
    echo "현재 브랜치: $current_branch"
    
    # 변경된 파일 보여주기
    echo "변경된 파일들:"
    git status --short
    
    # 커밋 메시지 입력받기
    read -p "커밋 메시지를 입력하세요: " commit_message
    
    if [ -z "$commit_message" ]; then
        echo -e "${RED}커밋 메시지를 입력해야 합니다!${NC}"
        return
    fi
    
    # 모든 변경사항 추가
    git add .
    
    # 커밋
    git commit -m "$commit_message"
    
    # 원격 저장소에 푸시
    git push origin "$current_branch"
    
    echo -e "${GREEN}✅ 작업이 성공적으로 저장되었습니다!${NC}"
}

# 3. 최신 코드 받기
get_latest_code() {
    echo -e "${YELLOW}최신 코드를 받아옵니다...${NC}"
    
    current_branch=$(git branch --show-current)
    
    if [ "$current_branch" = "main" ]; then
        git pull origin main
    else
        echo "현재 브랜치: $current_branch"
        echo "main 브랜치의 최신 코드를 현재 브랜치에 합칩니다."
        git checkout main
        git pull origin main
        git checkout "$current_branch"
        git merge main
    fi
    
    echo -e "${GREEN}✅ 최신 코드를 받아왔습니다!${NC}"
}

# 4. 브랜치 목록 보기
show_branches() {
    echo -e "${YELLOW}브랜치 목록:${NC}"
    echo "현재 브랜치는 * 로 표시됩니다"
    git branch -a
}

# 5. 브랜치 전환하기
switch_branch() {
    echo -e "${YELLOW}브랜치를 전환합니다...${NC}"
    
    # 로컬 브랜치 목록 보여주기
    echo "사용 가능한 브랜치:"
    git branch
    
    read -p "전환할 브랜치 이름을 입력하세요: " branch_name
    
    if [ -z "$branch_name" ]; then
        echo -e "${RED}브랜치 이름을 입력해야 합니다!${NC}"
        return
    fi
    
    git checkout "$branch_name"
    
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ '$branch_name' 브랜치로 전환되었습니다!${NC}"
    else
        echo -e "${RED}❌ 브랜치 전환에 실패했습니다.${NC}"
    fi
}

# 6. 현재 상태 확인
check_status() {
    echo -e "${YELLOW}현재 Git 상태를 확인합니다...${NC}"
    
    echo "현재 브랜치: $(git branch --show-current)"
    echo ""
    echo "변경된 파일들:"
    git status --short
    echo ""
    echo "최근 커밋 5개:"
    git log --oneline -5
}

# 7. 작업 완료 (PR 준비)
finish_work() {
    echo -e "${YELLOW}작업 완료를 준비합니다...${NC}"
    
    current_branch=$(git branch --show-current)
    
    if [ "$current_branch" = "main" ]; then
        echo -e "${RED}main 브랜치에서는 작업 완료를 할 수 없습니다!${NC}"
        return
    fi
    
    # 최종 저장
    echo "최종 저장을 진행합니다..."
    save_work
    
    echo ""
    echo -e "${GREEN}🎉 작업이 완료되었습니다!${NC}"
    echo "이제 GitHub에서 Pull Request를 생성하세요:"
    echo "👉 https://github.com/[사용자명]/[저장소명]/compare/$current_branch"
    echo ""
    echo "PR 생성 후, main 브랜치로 돌아가려면 옵션 8을 선택하세요."
}

# 8. main 브랜치로 돌아가기
go_to_main() {
    echo -e "${YELLOW}main 브랜치로 돌아갑니다...${NC}"
    
    git checkout main
    git pull origin main
    
    echo -e "${GREEN}✅ main 브랜치로 돌아왔습니다!${NC}"
}

# 메인 메뉴
show_menu() {
    print_logo
    echo "현재 브랜치: $(git branch --show-current 2>/dev/null || echo 'Git 저장소가 아님')"
    echo ""
    echo "원하는 작업을 선택하세요:"
    echo ""
    echo "1️⃣  새 작업 시작하기 (브랜치 생성)"
    echo "2️⃣  작업 저장하기 (add + commit + push)"
    echo "3️⃣  최신 코드 받기 (pull)"
    echo "4️⃣  브랜치 목록 보기"
    echo "5️⃣  브랜치 전환하기"
    echo "6️⃣  현재 상태 확인"
    echo "7️⃣  작업 완료하기 (PR 준비)"
    echo "8️⃣  main 브랜치로 돌아가기"
    echo "9️⃣  종료"
    echo ""
}

# 메인 실행 루프
main() {
    while true; do
        show_menu
        read -p "선택: " choice
        
        case $choice in
            1)
                start_new_work
                ;;
            2)
                save_work
                ;;
            3)
                get_latest_code
                ;;
            4)
                show_branches
                ;;
            5)
                switch_branch
                ;;
            6)
                check_status
                ;;
            7)
                finish_work
                ;;
            8)
                go_to_main
                ;;
            9)
                echo -e "${GREEN}Git 자동화 도우미를 종료합니다. 수고하셨습니다! 👋${NC}"
                exit 0
                ;;
            *)
                echo -e "${RED}잘못된 선택입니다. 1-9 사이의 숫자를 입력하세요.${NC}"
                ;;
        esac
        
        echo ""
        read -p "계속하려면 Enter를 누르세요..."
        clear
    done
}

# Git 저장소 확인
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo -e "${RED}❌ 현재 디렉토리가 Git 저장소가 아닙니다!${NC}"
    echo "Git 저장소로 이동한 후 다시 실행해주세요."
    exit 1
fi

# 스크립트 실행
main