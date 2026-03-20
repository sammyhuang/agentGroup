# API Structured Template

> Convert interface documentation to this format

---

## META
```yaml
Module: [Module name]
Version: v1.0
Base Path: /api/v1
Authentication: Bearer Token | Cookie | None
```

## API List

| Method | Path | Description | Auth |
|--------|------|-------------|------|
| POST | /user/login | User login | ❌ |
| GET | /user/info | Get user info | ✅ |
| PUT | /user/update | Update user info | ✅ |

---

## API Details

### POST /user/login
> User login

**Request**
```json
{
  "username": "string, required, username/phone",
  "password": "string, required, MD5 password"
}
```

**Response**
```json
{
  "code": "number, 0=success",
  "data": {
    "token": "string, JWT token",
    "expires": "number, expiration timestamp"
  },
  "msg": "string, error message"
}
```

**Error Codes**
| code | Description |
|------|-------------|
| 0 | Success |
| 1001 | Username not found |
| 1002 | Password incorrect |
| 1003 | Account locked |

---

### GET /user/info
> Get current user information

**Request Headers**
```yaml
Authorization: Bearer {token}
```

**Request Parameters**: None

**Response**
```json
{
  "code": 0,
  "data": {
    "id": "number, user ID",
    "username": "string, username",
    "avatar": "string, avatar URL",
    "role": "string, admin|user",
    "createdAt": "string, ISO time"
  }
}
```

---

### PUT /user/update
> Update user information

**Request**
```json
{
  "nickname": "string, optional, nickname",
  "avatar": "string, optional, avatar URL",
  "phone": "string, optional, phone number"
}
```

**Response**
```json
{
  "code": 0,
  "msg": "Update successful"
}
```

---

## General Instructions

### Authentication
```
Request header: Authorization: Bearer {token}
Expiration: 7 days
Refresh mechanism: Can refresh 1 day before expiration
```

### Response Format
```json
{
  "code": "number, 0=success, non-0=failure",
  "data": "any, business data",
  "msg": "string, message"
}
```

### Common Error Codes
| code | Description |
|------|-------------|
| 401 | Not logged in/Token expired |
| 403 | No permission |
| 500 | Server error |

### Pagination Parameters
```yaml
page: Page number, starts from 1
size: Items per page, default 20
```

### Pagination Response
```json
{
  "list": [],
  "total": "number, total count",
  "page": "number, current page",
  "size": "number, items per page"
}
```

---

<!--
Conversion guide:
1. Annotate each field with type + required + description
2. Use example values instead of descriptions
3. List error codes centrally
4. Extract common rules to bottom
-->