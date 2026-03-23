# Open Source Software Audit: Git

**Student Name:** Ekjot Singh  
**Roll Number:** 24BCE10284  
**Chosen Software:** Git (Distributed Version Control System)

## Project Overview

This repository contains five POSIX-compliant bash scripts developed as part of a systems-level technical audit of Git. These scripts demonstrate practical administrative automation on a Linux environment, ranging from system health monitoring to log file analysis.

---

## Script Descriptions

### 1. System Identity Report (`01_system_identity.sh`)
Acts as an administrative welcome screen. It dynamically fetches kernel information, user context, and OS distribution details, while acknowledging the GPLv2 license of the underlying Linux system.

### 2. FOSS Package Inspector (`02_package_inspector.sh`)
A dependency auditor that utilizes `dpkg` to verify if the chosen software (Git) is installed, extracts its current version, and prints a philosophical note regarding its role in the open-source ecosystem.

### 3. Disk and Permission Auditor (`03_disk_auditor.sh`)
Iterates through critical Linux directories (e.g., `/etc`, `/var/log`) and Git's core configuration paths, reporting on ownership, POSIX permissions, and human-readable disk usage.

### 4. Log File Analyzer (`04_log_analyzer.sh`)
Scans system log files (default: `/var/log/syslog`) for specific keywords (e.g., `error`). It counts total occurrences and extracts the most recent anomalies, demonstrating text processing pipelines.

### 5. Open Source Manifesto Generator (`05_manifesto_generator.sh`)
An interactive script that accepts user input regarding open-source philosophy and dynamically concatenates those responses into a persistent `.txt` file, serving as a personalized manifesto.

---

## Instructions to Run the Scripts

These scripts are designed for a **Debian/Ubuntu-based Linux environment**.

### Prerequisites & Dependencies

- A Linux terminal (Native or WSL)
- `dpkg` package manager *(required for Script 2)*
- Read access to `/var/log/syslog` *(required for Script 4 — may need `sudo`)*

### Step-by-Step Execution

**1. Clone the repository:**
```bash
git clone https://github.com/ekjotsinghmakhija/oss-audit-24BCE10284.git
cd oss-audit-24BCE10284
```

**2. Make the scripts executable:**
```bash
chmod +x *.sh
```

**3. Execute the scripts individually:**
```bash
./01_system_identity.sh
./02_package_inspector.sh
./03_disk_auditor.sh

# For Script 4, optionally pass a file path and search term:
./04_log_analyzer.sh /var/log/syslog error

./05_manifesto_generator.sh
```

---

## Repository Link

🔗 [https://github.com/ekjotsinghmakhija/oss-audit-24BCE10284](https://github.com/ekjotsinghmakhija/oss-audit-24BCE10284)
