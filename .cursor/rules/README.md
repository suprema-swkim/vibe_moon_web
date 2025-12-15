# 📚 Cursor AI Rules - 바이브코딩 규칙 모음

이 디렉토리는 Flutter Web 프로젝트의 바이브코딩(Vibe Coding)을 위한 AI 규칙 파일들을 포함합니다.

## 📁 폴더 구조

```
.cursor/rules/
├── README.md
├── ai/                 # 🤖 AI 공통 규칙
├── project/            # 📱 프로젝트 규칙
├── architecture/       # 🏗️ 아키텍처
├── api/                # 🌐 API 규칙
└── test/               # 🧪 테스트 규칙
```

## 📋 규칙 파일 목록

### 🤖 ai/ - AI 공통 규칙 (AI Common Rules)

AI가 모든 프로젝트에서 공통으로 따라야 할 핵심 규칙

| 파일 | 설명 | 우선순위 |
|------|------|----------|
| [ai-role.mdc](./ai/ai-role.mdc) | AI의 역할 정의 및 책임 | 🔴 필수 |
| [chain-of-thought.mdc](./ai/chain-of-thought.mdc) | 단계적 사고 과정 규칙 | 🟡 중요 |
| [ai-fit-score.mdc](./ai/ai-fit-score.mdc) | AI 룰 품질 평가 기준 | 🟢 권장 |

### 📱 project/ - 프로젝트 규칙 (Project Rules)

프로젝트별 도메인 용어, 언어 규칙, UI/UX 가이드

| 파일 | 설명 | 우선순위 |
|------|------|----------|
| [development-dictionary.mdc](./project/development-dictionary.mdc) | 도메인 용어 사전 | 🔴 필수 |
| [flutter-rule.mdc](./project/flutter-rule.mdc) | Flutter 코딩 규칙 | 🔴 필수 |
| [ui-ux-guidelines.mdc](./project/ui-ux-guidelines.mdc) | UI/UX 가이드라인 | 🟡 중요 |

### 🏗️ architecture/ - 아키텍처 (Architecture)

프로젝트 구조 및 아키텍처 패턴

| 파일 | 설명 | 우선순위 |
|------|------|----------|
| [project-structure.mdc](./architecture/project-structure.mdc) | 폴더 구조 및 명명 규칙 | 🔴 필수 |

### 🌐 api/ - API 규칙 (API Rules)

API 통합, 에러 처리, 향후 MCP 관련

| 파일 | 설명 | 우선순위 |
|------|------|----------|
| [api-integration.mdc](./api/api-integration.mdc) | API 통합 규칙 | 🟡 중요 |
| [error-handling.mdc](./api/error-handling.mdc) | 에러 처리 규칙 | 🟡 중요 |

### 🧪 test/ - 테스트 규칙 (Test Rules)

테스트 전략 및 Git 워크플로우

| 파일 | 설명 | 우선순위 |
|------|------|----------|
| [testing-strategy.mdc](./test/testing-strategy.mdc) | 테스트 전략 | 🟢 권장 |
| [git-workflow.mdc](./test/git-workflow.mdc) | Git 워크플로우 | 🟢 권장 |

## 🎯 규칙 파일 사용 방법

### 1️⃣ 프로젝트 시작 전

```
✅ ai/ai-role.mdc - AI의 역할 이해
✅ project/development-dictionary.mdc - 도메인 용어 학습
✅ architecture/project-structure.mdc - 프로젝트 구조 파악
```

### 2️⃣ 코드 작성 시

```
✅ project/flutter-rule.mdc - Flutter 코딩 규칙 준수
✅ ai/chain-of-thought.mdc - 복잡한 로직 시 단계적 접근
```

### 3️⃣ API 연동 시

```
✅ api/api-integration.mdc - API 통합 방법
✅ api/error-handling.mdc - 에러 처리
```

### 4️⃣ UI 구현 시

```
✅ project/ui-ux-guidelines.mdc - UI/UX 가이드라인
```

### 5️⃣ 품질 보증 시

```
✅ test/testing-strategy.mdc - 테스트 작성
✅ test/git-workflow.mdc - 커밋 및 PR
```

## 📈 우선순위 가이드

### 🔴 필수 (항상 준수)
- `ai/ai-role.mdc` - AI의 역할과 책임
- `project/development-dictionary.mdc` - 도메인 용어
- `project/flutter-rule.mdc` - Flutter 코딩 규칙
- `architecture/project-structure.mdc` - 프로젝트 구조

### 🟡 중요 (기능 구현 시 참조)
- `ai/chain-of-thought.mdc` - 복잡한 문제 해결
- `project/ui-ux-guidelines.mdc` - UI/UX
- `api/api-integration.mdc` - API 통합
- `api/error-handling.mdc` - 에러 처리

### 🟢 권장 (품질 향상)
- `ai/ai-fit-score.mdc` - 규칙 품질 평가
- `test/testing-strategy.mdc` - 테스트 작성
- `test/git-workflow.mdc` - Git 워크플로우

## 🔄 폴더 구조 설계 원칙

### 1. AI 공통 규칙 (ai/)
- **목적**: 모든 프로젝트에서 재사용 가능한 AI 규칙
- **특징**: 프로젝트 독립적, 범용적
- **예시**: AI 역할, 사고 과정, 평가 기준

### 2. 프로젝트 규칙 (project/)
- **목적**: 이 프로젝트만의 고유한 규칙
- **특징**: 프로젝트 종속적, 도메인 특화
- **예시**: 용어 사전, 언어별 규칙, UI/UX

### 3. 아키텍처 (architecture/)
- **목적**: 프로젝트 구조 및 패턴
- **특징**: 폴더 구조, 명명 규칙
- **예시**: Clean Architecture, MVVM

### 4. API 규칙 (api/)
- **목적**: API 통합 및 에러 처리
- **특징**: 외부 연동, 데이터 통신
- **예시**: REST API, MCP (향후)

### 5. 테스트 규칙 (test/)
- **목적**: 품질 보증 및 버전 관리
- **특징**: 테스트, Git, CI/CD
- **예시**: 테스트 전략, Git 워크플로우

## 💡 규칙 파일 작성 원칙

모든 규칙 파일은 다음 원칙을 따릅니다:

1. **명확성** - 모호하지 않고 명확한 지침
2. **일관성** - 다른 규칙 파일과 일관된 스타일
3. **실행 가능성** - 즉시 적용 가능한 구체적 예시
4. **위험 회피** - 잠재적 문제 예방
5. **AI 최적화** - AI가 이해하고 적용하기 쉬운 구조

## 📊 폴더별 빠른 참조

| 폴더 | 용도 | 파일 수 | 우선순위 |
|------|------|---------|----------|
| `ai/` | AI 공통 규칙 | 3 | 🔴 필수 |
| `project/` | 프로젝트 규칙 | 3 | 🔴 필수 |
| `architecture/` | 아키텍처 | 1 | 🔴 필수 |
| `api/` | API 규칙 | 2 | 🟡 중요 |
| `test/` | 테스트 규칙 | 2 | 🟢 권장 |

## 🔄 규칙 파일 업데이트

### 업데이트가 필요한 경우
- 새로운 패턴이나 베스트 프랙티스 발견
- 프로젝트 요구사항 변경
- 팀 내 합의된 규칙 변경
- 기술 스택 업데이트

### 업데이트 절차
1. 변경이 필요한 규칙 파일 식별
2. 변경 사항 작성 및 검토
3. 팀 내 합의
4. 규칙 파일 업데이트
5. 관련 코드 리팩토링 (필요시)

## 📞 문의 및 피드백

규칙 파일에 대한 문의나 개선 제안이 있으면:
- 이슈 생성
- PR 제출
- 팀 회의에서 논의

---

**마지막 업데이트**: 2024년 12월 15일  
**버전**: 3.0.0  
**상태**: ✅ 완료  

🎉 **v3.0.0 업데이트**: 폴더 구조 간소화 (5개 폴더 → 5개 용도별 폴더)
- `ai/` - AI 공통 규칙
- `project/` - 프로젝트 규칙
- `architecture/` - 아키텍처
- `api/` - API 규칙
- `test/` - 테스트 규칙
