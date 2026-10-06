#!/usr/bin/env bash
# Injects programme status into every new Claude session.
dir="${CLAUDE_PROJECT_DIR:-$(pwd)}"
today=$(date +%F)
open=$(awk '/^## Open/{f=1;next} /^## /{f=0} f && /^\| [0-9]{4}-/' "$dir/progress/weak-areas.md" 2>/dev/null | wc -l)
due=$(grep -oE '[0-9]{4}-[0-9]{2}-[0-9]{2}' "$dir/progress/review-queue.md" 2>/dev/null | awk -v t="$today" '$0<=t' | wc -l)
mastered=$(grep -cE '^\| [0-9]+\.[0-9]+\.[0-9]+ \|.*\| ✅ \|' "$dir/progress/tracker.md" 2>/dev/null)
total=$(grep -cE '^\| [0-9]+\.[0-9]+\.[0-9]+ \| (L|DD|C|LAB) \|' "$dir/progress/tracker.md" 2>/dev/null)
echo "Today: $today · Concept sessions mastered: $mastered/$total · Open weak areas: $open · Review-queue dates due (approx): $due"

# Active track + remaining switch-track hours (sum of 'Est h' of the rows after the next session).
track=$(grep -m1 '^\*\*Active track:\*\*' "$dir/progress/STATUS.md" 2>/dev/null | sed 's/^\*\*Active track:\*\* *//')
next=$(grep -m1 '^\*\*Next session:\*\*' "$dir/progress/STATUS.md" 2>/dev/null \
  | grep -oE '(Gate [0-9]+(-[0-9]+)?|[0-9]+\.[0-9]+\.[0-9]+[a-z]?)' | head -1)
tf="$dir/plan/roadmap/TRACK-switch.md"
left="n/a"
if [ -f "$tf" ] && [ -n "$next" ]; then
  left=$(awk -F'|' -v n="$next" '
    /^\| [0-9]+ \|/ { id=$3; gsub(/^ +| +$/, "", id); h=$(NF-1); gsub(/ /, "", h)
                      if (seen) s += h; if (id == n) seen = 1 }
    END { if (seen) printf "%.1f h", s; else print "n/a (next session is not a switch-track row)" }' "$tf")
fi
echo "Active track: ${track:-depth (full roadmap)} · Switch-track hours remaining after next session (${next:-?}): $left"
echo
cat "$dir/progress/STATUS.md" 2>/dev/null
echo
echo "Progress over timeline: resume from 'Next session' (active track). Suggest /today if the learner hasn't said what they want."
