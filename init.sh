if ! which uv > /dev/null 2>&1; then
  if which wget > /dev/null 2>&1; then
    echo "Baixando com wget..."
    wget -qO- https://astral.sh/uv/install.sh | sh
  else
    if which curl > /dev/null 2>&1; then
      echo "Baixando com curl..."
      curl -LsSf https://astral.sh/uv/install.sh | sh
    else
      echo "Digite a senha de sudo para instalar o curl:"
      sudo apt install curl
      echo "Baixando com curl..."
      curl -LsSf https://astral.sh/uv/install.sh | sh
    fi
  fi
  source $HOME/.local/bin/env
fi

echo "Sincronizando projeto..."
uv sync
source .venv/bin/activate
jupyter lab
