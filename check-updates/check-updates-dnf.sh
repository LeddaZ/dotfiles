#!/bin/bash
# Notify via Telegram when DNF updates are available (Fedora/RHEL).

# Variables
TG_TOKEN=""
TG_CHAT_ID=""
HOSTNAME=$(hostname)

# Check for updates (exit code 100 = updates available)
OUTPUT=$(dnf check-update --quiet 2>/dev/null)
EXIT_CODE=$?
 
if [ "$EXIT_CODE" -eq 100 ]; then
  # Names of packages with security advisories (needs repo updateinfo, which Fedora provides)
  SECURITY=$(dnf check-update --quiet --security 2>/dev/null \
    | awk 'NF == 3 && $1 ~ /\./ { print $1 }')
 
  # Keep only "name.arch version repo" lines; print "<package> <new-version>"
  UPDATES=$(echo "$OUTPUT" | awk -v sec="$SECURITY" '
    BEGIN { n = split(sec, s, "\n"); for (i = 1; i <= n; i++) secset[s[i]] = 1 }
    NF == 3 && $1 ~ /\./ && $3 !~ /^@/ {
      tag = ($1 in secset) ? " [security]" : ""
      print $1, $2 tag
    }')
 
  [ -z "$UPDATES" ] && exit 0
  COUNT=$(echo "$UPDATES" | wc -l)
 
  # Escape characters that break Telegram's HTML parse mode
  UPDATES=$(echo "$UPDATES" | sed -e 's/&/\&amp;/g' -e 's/</\&lt;/g' -e 's/>/\&gt;/g')
 
  # Telegram caps messages at 4096 chars; trim the list if needed
  if [ "${#UPDATES}" -gt 3800 ]; then
    UPDATES="${UPDATES:0:3800}
…(truncated)"
  fi
 
  curl --silent --output /dev/null \
    "https://api.telegram.org/bot${TG_TOKEN}/sendMessage" \
    -d "chat_id=${TG_CHAT_ID}" \
    -d "disable_web_page_preview=true" \
    -d "parse_mode=HTML" \
    --data-urlencode "text=<b>${COUNT} updates available on ${HOSTNAME}</b>
${UPDATES}"
fi
