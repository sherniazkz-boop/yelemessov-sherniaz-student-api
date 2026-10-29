#!/bin/bash
# Run from project root. Everything is saved to logs/part1_evidence.txt
cd "$(dirname "$0")/.." || exit 1
S=Yelemessov_Sherniaz
{
echo "### 1.1 tree + file check"; (command -v tree >/dev/null && tree -a -I '.git|build|.gradle' . || find . -not -path './.git*' | sort)
for f in Dockerfile docker-compose.yml Jenkinsfile build.gradle README.md scripts/${S}_system_report.sh logs/${S}_system_report.log; do [ -e "$f" ] && echo "OK $f" || echo "MISSING $f"; done
echo; echo "### 1.2 run report"; ./scripts/${S}_system_report.sh >/dev/null; echo "report appended to log"
echo; echo "### 1.3 permissions + backup"
chmod 755 scripts/${S}_system_report.sh
cp README.md backups/README_Yelemessov_Sherniaz_backup.md
ls -l scripts/ backups/
diff README.md backups/README_Yelemessov_Sherniaz_backup.md && echo "backup identical"
cat backups/README_Yelemessov_Sherniaz_backup.md
echo; echo "### 1.4 processes / log analysis"
ps aux | head -5; echo "--- java processes:"; ps aux | grep -i [j]ava || echo "no java process running"
echo "--- tail -n 5 log"; tail -n 5 logs/${S}_system_report.log
grep -n "Yelemessov" logs/${S}_system_report.log > ${S}_log_analysis.txt
echo "--- ${S}_log_analysis.txt:"; cat ${S}_log_analysis.txt
} 2>&1 | tee logs/part1_evidence.txt
