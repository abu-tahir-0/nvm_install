# NVM Installation Scripts

This repository contains automated installation scripts for NVM (Node Version Manager) on different operating systems.

## 📁 Files

- `install_nvm.ps1` - PowerShell script for Windows
- `install_nvm.sh` - Bash script for Linux/macOS

## 📥 Getting the Scripts

### Method 1: Clone the Repository (Recommended)

**Using Git:**
```bash
# Clone the repository
git clone https://github.com/abu-tahir-0/nvm_install.git

# Navigate to the directory
cd nvm_install
```

**Using GitHub CLI:**
```bash
# Clone using GitHub CLI
gh repo clone abu-tahir-0/nvm_install

# Navigate to the directory
cd nvm_install
```

### Method 2: Download ZIP

1. **Go to the repository**: [https://github.com/abu-tahir-0/nvm_install](https://github.com/abu-tahir-0/nvm_install)
2. **Click the green "Code" button**
3. **Select "Download ZIP"**
4. **Extract the ZIP file** to your desired location
5. **Navigate to the extracted folder**

### Method 3: Download Individual Files

**Windows PowerShell:**
```powershell
# Create directory
mkdir nvm_install
cd nvm_install

# Download Windows script
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/abu-tahir-0/nvm_install/main/install_nvm.ps1" -OutFile "install_nvm.ps1"
```

**Linux/macOS:**
```bash
# Create directory
mkdir nvm_install
cd nvm_install

# Download Linux script
curl -o install_nvm.sh https://raw.githubusercontent.com/abu-tahir-0/nvm_install/main/install_nvm.sh
```

## 🖥️ Windows Installation

### Prerequisites
- Windows 10/11
- PowerShell 5.1 or later
- Administrator privileges

### Installation Steps

1. **Open PowerShell as Administrator**
   ```powershell
   # Right-click on PowerShell and select "Run as Administrator"
   ```

2. **Navigate to the downloaded/cloned directory**
   ```powershell
   # If you cloned the repository
   cd nvm_install
   
   # Or if you downloaded and extracted ZIP
   cd "path\to\extracted\nvm_install"
   ```

3. **Set execution policy (if needed)**
   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```

4. **Run the installation script**
   ```powershell
   .\install_nvm.ps1
   ```

5. **Restart PowerShell or refresh environment**
   ```powershell
   refreshenv
   # OR restart your terminal
   ```

6. **Verify installation**
   ```powershell
   nvm version
   ```

### What the Windows script does:
- ✅ Downloads the latest NVM for Windows from GitHub
- ✅ Installs NVM automatically
- ✅ Configures environment variables (`NVM_HOME`, `NVM_SYMLINK`)
- ✅ Updates system PATH
- ✅ Optionally installs latest Node.js LTS

---

## 🐧 Linux/macOS Installation

### Prerequisites
- Linux distribution or macOS
- Bash shell
- curl (usually pre-installed)
- Internet connection

### Installation Steps

1. **Open Terminal**

2. **Navigate to the downloaded/cloned directory**
   ```bash
   # If you cloned the repository
   cd nvm_install
   
   # Or if you downloaded and extracted ZIP
   cd /path/to/extracted/nvm_install
   ```

3. **Make the script executable**
   ```bash
   chmod +x install_nvm.sh
   ```

4. **Run the installation script**
   ```bash
   ./install_nvm.sh
   ```

5. **Restart terminal or reload shell profile**
   ```bash
   source ~/.bashrc
   # OR for zsh users
   source ~/.zshrc
   # OR restart your terminal
   ```

6. **Verify installation**
   ```bash
   nvm --version
   ```

### What the Linux script does:
- ✅ Downloads the latest NVM from the official repository
- ✅ Installs NVM using the official installation method
- ✅ Configures shell profile (`.bashrc`, `.zshrc`, etc.)
- ✅ Sets up NVM environment variables
- ✅ Optionally installs latest Node.js LTS

---

## 🚀 Quick Start Commands

### After Installation (Both Systems)

#### Install Node.js versions:
```bash
# Install latest Node.js
nvm install node

# Install latest LTS version
nvm install --lts

# Install specific version
nvm install 18.17.0
nvm install 20.9.0
```

#### Switch between versions:
```bash
# Use latest version
nvm use node

# Use latest LTS
nvm use --lts

# Use specific version
nvm use 18.17.0
```

#### List versions:
```bash
# List installed versions
nvm ls

# List available versions (remote)
nvm ls-remote        # Linux/macOS
nvm list available   # Windows
```

#### Set default version:
```bash
# Set default Node.js version
nvm alias default 18.17.0    # Linux/macOS
nvm alias default 18.17.0    # Windows (same command)
```

---

## 🛠️ Troubleshooting

### Windows Issues

**PowerShell Execution Policy Error:**
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

**NVM command not found after installation:**
```powershell
# Restart PowerShell or run:
refreshenv
```

**Permission denied:**
- Make sure you're running PowerShell as Administrator

### Linux/macOS Issues

**Permission denied:**
```bash
chmod +x install_nvm.sh
```

**NVM command not found after installation:**
```bash
# Reload your shell profile
source ~/.bashrc    # or ~/.zshrc for zsh users

# Or restart your terminal
```

**curl not found:**
```bash
# Ubuntu/Debian
sudo apt update && sudo apt install curl

# CentOS/RHEL
sudo yum install curl

# macOS (using Homebrew)
brew install curl
```

---

## 📋 System Requirements

| System | Requirements |
|--------|-------------|
| **Windows** | Windows 10/11, PowerShell 5.1+, Administrator access |
| **Linux** | Most distributions, Bash, curl |
| **macOS** | macOS 10.12+, Terminal, curl |

---

## 🔧 Manual Installation (Alternative)

### Windows
Visit: [NVM for Windows](https://github.com/coreybutler/nvm-windows)

### Linux/macOS
Visit: [NVM Official](https://github.com/nvm-sh/nvm)

---

## 📝 Notes

- **Windows** uses `nvm-windows` (different project than Linux/macOS)
- **Linux/macOS** uses the official `nvm` project
- Both scripts will automatically install the latest version available
- Scripts include optional Node.js LTS installation
- Environment variables and PATH are configured automatically

---

## 🤝 Contributing

Feel free to submit issues or pull requests to improve these installation scripts.

---

## 📄 License

These scripts are provided as-is for educational and convenience purposes.