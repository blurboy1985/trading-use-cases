#!/bin/bash

# OpenClaw Trading Use Cases - GitHub Pages Deployment Script
# Usage: ./deploy.sh <github-username> [repository-name]

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🦞 OpenClaw Trading Use Cases - GitHub Pages Deploy${NC}"
echo "=================================================="

# Check arguments
if [ -z "$1" ]; then
    echo -e "${RED}Error: GitHub username required${NC}"
    echo "Usage: ./deploy.sh <github-username> [repository-name]"
    echo "Example: ./deploy.sh blurboy1985 trading-use-cases"
    exit 1
fi

GITHUB_USERNAME=$1
REPO_NAME=${2:-trading-use-cases}
REPO_URL="https://github.com/${GITHUB_USERNAME}/${REPO_NAME}.git"

echo -e "${YELLOW}GitHub Username:${NC} ${GITHUB_USERNAME}"
echo -e "${YELLOW}Repository:${NC} ${REPO_NAME}"
echo -e "${YELLOW}Repository URL:${NC} ${REPO_URL}"
echo ""

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo -e "${RED}Error: git is not installed. Please install git first.${NC}"
    exit 1
fi

# Check if we're in the right directory
if [ ! -f "index.html" ]; then
    echo -e "${RED}Error: index.html not found. Please run this script from the trading-use-cases directory.${NC}"
    exit 1
fi

# Create temporary directory for deployment
TEMP_DIR=$(mktemp -d)
echo -e "${YELLOW}Creating temporary deployment directory:${NC} ${TEMP_DIR}"

# Copy files to temp directory
cp index.html README.md deploy.sh "${TEMP_DIR}/"

# Check if repository already exists locally
if [ -d ".git" ]; then
    echo -e "${GREEN}✓ Existing git repository found${NC}"
    
    # Check if remote is set correctly
    CURRENT_REMOTE=$(git remote get-url origin 2>/dev/null || echo "")
    if [ "$CURRENT_REMOTE" != "$REPO_URL" ]; then
        echo -e "${YELLOW}Updating remote URL...${NC}"
        git remote set-url origin "$REPO_URL" 2>/dev/null || git remote add origin "$REPO_URL"
    fi
else
    echo -e "${YELLOW}Initializing new git repository...${NC}"
    cd "${TEMP_DIR}"
    git init
    git remote add origin "$REPO_URL"
fi

# Try to pull existing repository (if it exists)
echo -e "${YELLOW}Checking for existing repository...${NC}"
if git ls-remote "$REPO_URL" &> /dev/null; then
    echo -e "${GREEN}✓ Repository exists on GitHub${NC}"
    
    if [ ! -d ".git" ]; then
        echo -e "${YELLOW}Cloning existing repository...${NC}"
        cd "${TEMP_DIR}"
        git clone "$REPO_URL" . 2>/dev/null || true
        
        # Copy our files over
        cp /home/danielquek/.openclaw/workspace/trading-use-cases/index.html .
        cp /home/danielquek/.openclaw/workspace/trading-use-cases/README.md .
        cp /home/danielquek/.openclaw/workspace/trading-use-cases/deploy.sh .
    fi
else
    echo -e "${YELLOW}Repository does not exist on GitHub yet. It will be created on first push.${NC}"
    if [ ! -d ".git" ]; then
        cd "${TEMP_DIR}"
        git init
        git remote add origin "$REPO_URL"
    fi
fi

# Go to deployment directory
if [ ! -d ".git" ]; then
    cd "${TEMP_DIR}"
    git init
    git remote add origin "$REPO_URL"
fi

# Add and commit files
echo -e "${YELLOW}Adding files...${NC}"
git add -A

# Check if there are changes
if git diff --staged --quiet; then
    echo -e "${GREEN}✓ No changes to commit${NC}"
else
    echo -e "${YELLOW}Committing changes...${NC}"
    git commit -m "Deploy trading use cases catalogue to GitHub Pages

- Comprehensive catalogue of 40+ trading and finance use cases
- Searchable and filterable interface
- Risk level indicators
- Implementation guides
- Security considerations

Built with OpenClaw 🦞"
fi

# Push to GitHub
echo -e "${YELLOW}Pushing to GitHub...${NC}"
echo -e "${BLUE}Note: You may be prompted for your GitHub credentials${NC}"

if git push -u origin main 2>/dev/null; then
    BRANCH="main"
elif git push -u origin master 2>/dev/null; then
    BRANCH="master"
else
    echo -e "${RED}Error: Failed to push to GitHub${NC}"
    echo -e "${YELLOW}Troubleshooting tips:${NC}"
    echo "  1. Make sure the repository exists on GitHub"
    echo "  2. Check your GitHub credentials"
    echo "  3. Try: git push -u origin main (or master)"
    exit 1
fi

# Clean up temp directory if we created one
if [ "${TEMP_DIR}" != "." ] && [ "${TEMP_DIR}" != "$(pwd)" ]; then
    rm -rf "${TEMP_DIR}"
fi

# Success message
echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}✓ Deployment Successful!${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo -e "${BLUE}Your site will be available at:${NC}"
echo -e "${GREEN}https://${GITHUB_USERNAME}.github.io/${REPO_NAME}/${NC}"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo "1. Go to your GitHub repository: ${REPO_URL}"
echo "2. Navigate to Settings → Pages"
echo "3. Set Source to 'Deploy from branch'"
echo "4. Select branch: '${BRANCH}'"
echo "5. Select folder: '/' (root)"
echo "6. Click Save"
echo ""
echo -e "${BLUE}GitHub Pages may take 1-2 minutes to deploy.${NC}"
echo ""
