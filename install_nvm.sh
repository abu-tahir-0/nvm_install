#!/bin/bash

# NVM Installation Script for Linux
# Make sure to run with: chmod +x install_nvm.sh && ./install_nvm.sh

set -e

echo "🔄 Installing NVM (Node Version Manager) for Linux..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${CYAN}Fetching latest NVM release...${NC}"

# Get the latest release info from GitHub
LATEST_VERSION=$(curl -s https://api.github.com/repos/nvm-sh/nvm/releases/latest | grep -Po '"tag_name": "\K.*?(?=")')

if [ -z "$LATEST_VERSION" ]; then
    echo -e "${RED}❌ Failed to fetch latest NVM version${NC}"
    exit 1
fi

echo -e "${CYAN}Latest NVM version: ${LATEST_VERSION}${NC}"

# Download and install NVM
NVM_INSTALL_URL="https://raw.githubusercontent.com/nvm-sh/nvm/${LATEST_VERSION}/install.sh"

echo -e "${CYAN}Downloading and installing NVM...${NC}"
curl -o- $NVM_INSTALL_URL | bash

# Check if installation was successful
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ NVM installation completed successfully!${NC}"
else
    echo -e "${RED}❌ NVM installation failed${NC}"
    exit 1
fi

# Source NVM to make it available in current session
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

echo -e "${YELLOW}📝 Note: NVM has been added to your shell profile.${NC}"
echo -e "${YELLOW}   To use NVM in the current session, run:${NC}"
echo -e "${YELLOW}   source ~/.bashrc${NC}"
echo -e "${YELLOW}   (or restart your terminal)${NC}"

# Verify installation
if command -v nvm &> /dev/null; then
    echo -e "${GREEN}✅ NVM is now available in current session${NC}"
    echo -e "${CYAN}NVM version: $(nvm --version)${NC}"
else
    echo -e "${YELLOW}⚠️  NVM is installed but not yet available in current session${NC}"
    echo -e "${YELLOW}   Please restart your terminal or run: source ~/.bashrc${NC}"
fi

# Optional: auto-install latest Node LTS version
echo -e "${CYAN}Do you want to install the latest Node.js LTS version now? (y/n): ${NC}"
read -r response

if [[ "$response" =~ ^[Yy]$ ]]; then
    echo -e "${CYAN}Installing latest LTS Node.js...${NC}"
    
    # Source NVM first to ensure it's available
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    
    if command -v nvm &> /dev/null; then
        nvm install --lts
        nvm use --lts
        nvm alias default 'lts/*'
        echo -e "${GREEN}✅ Node.js LTS installed and set as default${NC}"
        echo -e "${CYAN}Node.js version: $(node --version)${NC}"
        echo -e "${CYAN}NPM version: $(npm --version)${NC}"
    else
        echo -e "${RED}❌ NVM not available. Please restart terminal and run:${NC}"
        echo -e "${YELLOW}   nvm install --lts${NC}"
        echo -e "${YELLOW}   nvm use --lts${NC}"
        echo -e "${YELLOW}   nvm alias default 'lts/*'${NC}"
    fi
fi

echo -e "${GREEN}🎉 Installation complete!${NC}"
echo -e "${CYAN}Useful NVM commands:${NC}"
echo -e "  ${YELLOW}nvm install node${NC}          # Install latest Node.js"
echo -e "  ${YELLOW}nvm install --lts${NC}         # Install latest LTS Node.js"
echo -e "  ${YELLOW}nvm install 18.17.0${NC}       # Install specific version"
echo -e "  ${YELLOW}nvm use node${NC}              # Use latest Node.js"
echo -e "  ${YELLOW}nvm use --lts${NC}             # Use latest LTS Node.js"
echo -e "  ${YELLOW}nvm use 18.17.0${NC}           # Use specific version"
echo -e "  ${YELLOW}nvm ls${NC}                    # List installed versions"
echo -e "  ${YELLOW}nvm ls-remote${NC}             # List available versions"
echo -e "  ${YELLOW}nvm alias default node${NC}    # Set default version"