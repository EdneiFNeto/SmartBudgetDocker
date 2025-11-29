# 🐳 Docker Desktop Installation Guide for macOS

## Method 1: Via Homebrew (Terminal)

1. Open Terminal
2. Run the command:
   ```bash
   brew install --cask docker
   ```
3. When prompted, enter your administrator password
4. Wait for installation to complete
5. Start Docker Desktop:
   ```bash
   open -a Docker
   ```

## Method 2: Manual Download

1. Visit: https://www.docker.com/products/docker-desktop/
2. Click "Download for Mac"
3. Wait for the `Docker.dmg` file to download
4. Open the downloaded file
5. Drag the Docker icon to the Applications folder
6. Open the Applications folder and double-click Docker
7. Wait for Docker Desktop to start (you'll see a whale icon in the macOS menu bar)

## Installation Verification

After installing and starting Docker Desktop, run in Terminal:

```bash
docker --version
docker info
```

If both commands work, Docker is installed and running! ✅

## Next Steps

After Docker is working, you can:

1. Navigate to the project directory:
   ```bash
   cd /Users/ednei/Dev/AI/SmartBudgetDocker
   ```

2. Start the PostgreSQL database:
   ```bash
   docker compose up -d
   ```

3. Verify the container is running:
   ```bash
   docker compose ps
   ```

## Common Issues

### "Docker daemon is not running"
- Make sure Docker Desktop is open
- Check if the whale icon is in the menu bar
- Wait a few seconds after opening Docker Desktop

### "Cannot connect to the Docker daemon"
- Open Docker Desktop manually from the Applications folder
- Wait until the status shows "Docker Desktop is running"

