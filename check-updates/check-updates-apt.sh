#!/bin/bash
# Notify via Telegram when APT updates are available (Debian).
# Must run as root (apt-get update needs it), e.g. from root's crontab.

# Variables
TG_TOKEN=""
TG_CHAT_ID=""
HOSTNAME=$(hostname)

# Refresh package lists
if ! apt-get update -qq >/dev/null 2>&1; then
  echo "apt-get update failed" >&2
  exit 1
fi
 
# Simulate a full upgrade. Output lines look like:
#   Inst openssl [3.0.15-1] (3.0.16-1~deb12u1 Debian-Security:12/stable-security [amd64])
# We print "<package> <new-version>" and tag security updates.
UPDATES=$(LANG=C apt-get -s dist-upgrade 2>/dev/null | awk '
  /^Inst / {
    ver = ($3 ~ /^\[/) ? $4 : $3
    gsub(/[()]/, "", ver)
    sec = ($0 ~ /-security/) ? " [security]" : ""
    print $2, ver sec
  }')
 
if [ -n "$UPDATES" ]; then
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
