# SSL Certificate Utility 🛡️

A **Bash-based toolkit** to manage, inspect, and verify SSL/TLS certificates — both locally and online.  
Whether you need to check expiry dates, validate certificate chains, or bundle files into an Nginx-ready certificate, this script has you covered.

---

## 📦 Requirements
- **Bash** (v4+ recommended)
- **OpenSSL** installed
- **unzip** installed (for handling `.zip` archives)
- Internet access (for online SSL checks)

---

## 🚀 Features & Commands

- **Check Expiration Dates**
  - `./ssl-cert.sh date /path/to/cert-directory` — Check expiry date of a specific `nginx.crt` file.
  - `./ssl-cert.sh all-cert-date` — List expiry dates for all `.nginx.crt` files in subdirectories.
  - `./ssl-cert.sh online example.com` — Check expiry date for a remote domain's SSL certificate.

- **Validate SSL Chains**
  - `./ssl-cert.sh ca-nginx /path/to/cert-directory` — Verify that `nginx.crt` is correctly signed by its `ca-bundle`.
  - `./ssl-cert.sh key-nginx /path/to/cert-directory` — Check if the `.key` file matches the `nginx.crt`.

- **Inspect Certificates**
  - `./ssl-cert.sh solo-nginx /path/to/cert-directory` — Display full details of `nginx.crt` (subject, issuer, validity, etc.).

- **Create SSL Bundles**
  - `./ssl-cert.sh nginx /path/to/cert-directory` — Merge `.crt` and `ca-bundle` into a single `nginx.nginx.crt`.
  - `./ssl-cert.sh 3-files /path/to/cert-directory` — Combine `.crt`, `intermediate.pem`, and `root.pem` into one `.nginx.crt`.

- **File Handling Utilities**
  - `./ssl-cert.sh copy-zip /path/to/target-dir /path/to/archive.zip` — Extract and rename SSL files from a `.zip` archive, removing leading underscores.
  - `./ssl-cert.sh copy /path/to/target-dir /path/to/source-dir` — Copy SSL files from another directory, cleaning file names.

- **Help & Reference**
  - `./ssl-cert.sh -a` — Show a quick list of all commands and their required arguments.
  - `./ssl-cert.sh -h` — Display detailed help with command descriptions.




---

## 🔧 Installation
Clone the repository and make the script executable:
```bash
git clone https://github.com/yourusername/ssl-cert-utility.git
cd SSL-Utility
chmod +x ssl-cert.sh
```

