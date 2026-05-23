# DevSecOps Pipeline

A CI/CD pipeline with integrated security scanning, built with TypeScript, Docker, Terraform and GitHub Actions.

---

## Architecture

<img width="351" height="383" alt="image" src="https://github.com/user-attachments/assets/13ec0d25-006d-4b19-8d62-adf8a89dfe16" />


---

## Tech Stack

- **Runtime**: Node.js + TypeScript
- **Containerisation**: Docker
- **Infrastructure**: Terraform (AWS S3)
- **CI/CD**: GitHub Actions
- **Security Scanning**: Trivy (container), Checkov (IaC)

---

## Pipeline Steps

| Step | Tool | Purpose |
|------|------|---------|
| Build | Docker | Containerise the application |
| Scan image | Trivy | Detect vulnerabilities in container |
| Scan IaC | Checkov | Detect misconfigurations in Terraform |

---

## Security Findings

**Trivy** found 18 vulnerabilities in the base `node:18-slim` image.

**Checkov** flagged the following in Terraform:
- ❌ S3 bucket missing KMS encryption
- ❌ Access logging not enabled
- ❌ Versioning not enabled
- ❌ Cross-region replication not enabled

These are documented and will be fixed

---

## Project Structure
```
devsecops/
├── src/              # TypeScript application
├── terraform/        # Infrastructure as code
├── .github/
│   └── workflows/    # CI/CD pipeline
├── Dockerfile
└── README.md
```
