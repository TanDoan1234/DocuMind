# Security Configuration

Protect your DocuMind instance with password authentication and advanced security measures.

---

## API Key Encryption

DocuMind automatically encrypts all AI provider API keys in the database using the Fernet algorithm (AES-128-CBC with HMAC-SHA256).

### Setting the Encryption Key

You must set a secret for the following environment variable:

```bash
# In .env or docker-compose.yml
OPEN_NOTEBOOK_ENCRYPTION_KEY=your-secret-key-here
```

**CRITICAL NOTE**: This variable is **mandatory**. Without it, you cannot save provider credentials. If you lose or change this key later, all previously saved API keys will become undecipherable.

---

## Password Protection

### When to Use
- Deploying to a public cloud or VPS.
- Shared network environments.
- Any time DocuMind is accessible outside your personal machine.

### How to Set
Add the following environment variable to your Docker configuration:

```yaml
environment:
  - OPEN_NOTEBOOK_PASSWORD=your_secure_password
```

Once set, all requests to the Web UI or API will require authentication.

---

## API Security

All API endpoints require the authorization header if a password is set:

```bash
# Authorized request
curl -H "Authorization: Bearer your_password" \
  http://localhost:5055/api/notebooks

# Unauthorized request
curl http://localhost:5055/api/notebooks
# Returns: {"detail": "Missing authorization header"}
```

---

## Hardening Measures

### Docker Configuration
For enhanced security, limit container privileges and scope:

```yaml
services:
  documind:
    image: tandoan/documind:latest
    ports:
      - "127.0.0.1:8502:8502"  # Bind only to localhost
    environment:
      - OPEN_NOTEBOOK_PASSWORD=very_strong_password
    security_opt:
      - no-new-privileges:true
```

### Firewall (UFW on Ubuntu)
```bash
sudo ufw allow ssh
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw deny 8502/tcp   # Block direct access to UI
sudo ufw deny 5055/tcp   # Block direct access to API
sudo ufw enable
```

---

## Data Safety Recommendations

1. **Always Use HTTPS**: Encrypt traffic over SSL/TLS using a reverse proxy.
2. **Strong Passwords**: Use at least 20 characters with a mix of cases, numbers, and symbols.
3. **Keep Updated**: Regularly pull the latest Docker image to receive security patches.
4. **Secure Backups**: Store your `OPEN_NOTEBOOK_ENCRYPTION_KEY` separately from your database backups.

By following these guidelines, you can ensure your research on **DocuMind** stays completely private and secure.
