# 🐳 Guia de Instalação do Docker Desktop no macOS

## Método 1: Via Homebrew (Terminal)

1. Abra o Terminal
2. Execute o comando:
   ```bash
   brew install --cask docker
   ```
3. Quando solicitado, insira sua senha de administrador
4. Aguarde a instalação concluir
5. Inicie o Docker Desktop:
   ```bash
   open -a Docker
   ```

## Método 2: Download Manual

1. Acesse: https://www.docker.com/products/docker-desktop/
2. Clique em "Download for Mac"
3. Aguarde o download do arquivo `Docker.dmg`
4. Abra o arquivo baixado
5. Arraste o ícone do Docker para a pasta Applications
6. Abra a pasta Applications e clique duas vezes no Docker
7. Aguarde o Docker Desktop iniciar (você verá o ícone de uma baleia na barra de menu do macOS)

## Verificação da Instalação

Após instalar e iniciar o Docker Desktop, execute no Terminal:

```bash
docker --version
docker info
```

Se ambos os comandos funcionarem, o Docker está instalado e funcionando! ✅

## Próximos Passos

Depois que o Docker estiver funcionando, você pode:

1. Navegar até o diretório do projeto:
   ```bash
   cd /Users/ednei/Dev/AI/Marketplace-DB
   ```

2. Iniciar o banco de dados PostgreSQL:
   ```bash
   docker-compose up -d
   ```

3. Verificar se o container está rodando:
   ```bash
   docker-compose ps
   ```

## Problemas Comuns

### "Docker daemon não está rodando"
- Certifique-se de que o Docker Desktop está aberto
- Verifique se o ícone da baleia está na barra de menu
- Aguarde alguns segundos após abrir o Docker Desktop

### "Cannot connect to the Docker daemon"
- Abra o Docker Desktop manualmente pela pasta Applications
- Aguarde até que o status fique "Docker Desktop is running"

