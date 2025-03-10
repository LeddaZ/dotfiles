# Set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# add Android SDK platform tools to path
if [ -d "$HOME/dev-stuff/platform-tools" ] ; then
    PATH="$HOME/dev-stuff/platform-tools:$PATH"
fi
