# =========================
# 🧠 BASICS + HISTORY
# =========================
HISTSIZE=10000
HISTFILESIZE=20000
shopt -s histappend
shopt -s checkwinsize

# =========================
# 🌈 COLORS ENABLED
# =========================
export CLICOLOR=1

if [ -x /usr/bin/dircolors ]; then
  eval "$(dircolors -b)"
fi

# Colored grep / diff
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'

# =========================
# 🚀 MODERN TOOLS ALIASES
# =========================

# eza instead of ls
alias ls='eza --icons --group-directories-first'
alias ll='eza -la --icons --group-directories-first'
alias la='eza -a --icons --group-directories-first'
alias lt='eza --tree --icons'

# bat instead of cat
alias cat='bat --paging=never'

# =========================
# 🧭 YAZI (CD ON EXIT FIX)
# =========================
y() {
  local tmp="$(mktemp)"
  yazi --cwd-file="$tmp"
  if [ -f "$tmp" ]; then
    local dir
    dir="$(cat "$tmp")"
    [ -n "$dir" ] && [ -d "$dir" ] && cd "$dir"
    rm -f "$tmp"
  fi
}

# =========================
# ⚡ EXTRA QUALITY OF LIFE
# =========================

# autocd (cd sin escribir cd)
shopt -s autocd

# better ls defaults fallback
export EZA_COLORS="di=1;36:fi=0:ln=1;35"

# =========================
# 🧹 CLEAN PROMPT HOOK (oh-my-posh lo gestionas tú)
# =========================

# evita prompt roto si cambias entorno
export PROMPT_DIRTRIM=3

# =========================
# 📦 PATH (por si acaso)
# =========================
export PATH="$HOME/.local/bin:$PATH"

eval "$(oh-my-posh init bash --config ~/.config/oh-my-posh/arch-minimal.omp.json)"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/dayr4n/.lmstudio/bin"
# End of LM Studio CLI section

