ANTIGEN="$HOME/antigen.zsh"
if [ ! -f $ANTIGEN ]; then
    echo "Fetching Antigen"
    curl -s -L --output $ANTIGEN https://git.io/antigen
fi

source $ANTIGEN

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme denysdovhan/spaceship-prompt

# Tell Antigen that you're done.
antigen apply

SPACESHIP_PROMPT_ORDER=(
  pyenv         # Pyenv section
  time          # Time stamps section
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
#  hg            # Mercurial section (hg_branch  + hg_status)
#  package       # Package version
#  node          # Node.js section
#  ruby          # Ruby section
#  elixir        # Elixir section
#  xcode         # Xcode section
#  swift         # Swift section
#  golang        # Go section
#  php           # PHP section
#  rust          # Rust section
#  haskell       # Haskell Stack section
#  julia         # Julia section
#  docker        # Docker section
#  aws           # Amazon Web Services section
#  venv          # virtualenv section
#  conda         # conda virtualenv section
#  dotnet        # .NET section
#  ember         # Ember.js section
#  kubecontext   # Kubectl context section
#  terraform     # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
#  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_PROMPT_DEFAULT_PREFIX=" "
SPACESHIP_PROMPT_DEFAULT_SUFFIX=" "
SPACESHIP_PROMPT_ADD_NEWLINE=false

SPACESHIP_CHAR_COLOR_SUCCESS="blue"
SPACESHIP_CHAR_SUFFIX=" "

SPACESHIP_HOST_SHOW="always"
SPACESHIP_HOST_PREFIX=""
SPACESHIP_HOST_SUFFIX=""
SPACESHIP_HOST_COLOR="green"

SPACESHIP_DIR_PREFIX=":"
SPACESHIP_DIR_TRUNC=0
SPACESHIP_DIR_TRUNC_REPO=false
SPACESHIP_DIR_COLOR="yellow"
SPACESHIP_GIT_PREFIX=""

