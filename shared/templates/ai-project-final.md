# AI Project Adaptation Document Template

> Location: `Project root/.claude/project.md`
> Commit to git, shared by team

---

# [Project Name]

## Project Overview
```yaml
Name: xxx
One-line description: xxx
Tech Stack: Frontend Vue3 + Backend NestJS + MySQL
Repository: git@xxx.git
Owner: xxx
```

## Module Map

> Navigation table for AI development, quickly locate code

| Business Function | Module Path | Key Files | Description |
|------------------|-------------|-----------|-------------|
| User Login | src/modules/auth/ | auth.service.ts | JWT authentication |
| User Management | src/modules/user/ | user.service.ts | CRUD |
| Order Management | src/modules/order/ | order.service.ts | State machine flow |
| Payment | src/modules/payment/ | payment.service.ts | WeChat/Alipay integration |

## Business Concepts

> Domain terminology that AI must understand

| Term | Meaning | Example |
|------|---------|---------|
| SKU | Stock Keeping Unit | iPhone 15 Black 128G |
| SPU | Standard Product Unit | iPhone 15 |

## Data Flow

```
Request → Controller → Service → Repository → MySQL
                        ↓
                   Redis Cache
```

## Prohibitions

> Things AI absolutely must not do

- ❌ Do not modify `src/config/prod.ts` production config
- ❌ Do not delete any files under `migrations/`
- ❌ Do not directly operate database, must use Repository
- ❌ Do not hardcode secrets in code

## Development Standards

> Standards AI follows when writing code

```yaml
Language: TypeScript strict mode
Naming:
  - Files: kebab-case (user-service.ts)
  - Classes: PascalCase (UserService)
  - Methods: camelCase (findById)
Comments: Chinese, must comment key logic
Error Handling: Uniformly throw BusinessException
Logging: Use this.logger, not console.log
```

## Test Verification

> How to verify after code changes

```bash
# Unit tests
npm run test

# E2E tests
npm run test:e2e

# Local startup verification
npm run dev
# Access http://localhost:3000/api/health
```

## Common Issues

> Pitfalls already encountered, avoid AI repeating them

| Issue | Cause | Solution |
|-------|-------|----------|
| Startup error port occupied | Previous process not cleanly closed | `lsof -i:3000` then kill |
| Database connection failed | MySQL not started | `docker-compose up -d` |

## Current Iteration

> What's currently being worked on (optional, frequently updated)

```yaml
Version: v2.3.0
Branch: feature/payment-refund
Tasks:
  - [ ] Refund function development
  - [ ] Refund notification integration
```

## Change Log

> Major change records (optional)

### 2024-02-01
- Added payment module `src/modules/payment/`
- Order module added payment status field

---

<!--
Maintenance guide:
1. Module map, business concepts, prohibitions → Changes infrequently, update occasionally
2. Current iteration → Update once per iteration
3. Change log → Record when major changes occur
4. Commit to git, share with team
-->