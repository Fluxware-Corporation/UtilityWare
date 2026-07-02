# 🔒 Security Policy

## Supported versions

UtilityWare ships tools as source. We provide security updates for the latest `main` branch only.

## Reporting a vulnerability

If you discover a security vulnerability in any UtilityWare tool:

1. **Do not open a public issue.**
2. Email the maintainers with a description and a proof-of-concept.
3. You will receive an acknowledgement within 72 hours.
4. We will coordinate a fix and disclosure timeline with you.

## Scope

- Security bugs in the *tool scripts themselves* (e.g. command injection, unsafe tempfile creation, insecure crypto).
- Security bugs in the `install.sh` / `uninstall.sh` scripts.

## Out of scope

- Vulnerabilities in third-party dependencies the tools *invoke* (e.g. `openssl`, `curl`) — report those upstream.
- Issues that require the attacker to already control the user's PATH or shell rc files.

## Hardening tips

- Tools that handle passwords or tokens read them from stdin or env vars — never from argv (which is visible in `ps`).
- Tools that write tempfiles use `mktemp` and clean up after themselves.
- Tools that fetch from the network pin HTTPS endpoints only.
