#!/bin/bash
# After resolving conflict. Replace YOUR_GITHUB_USER. Create empty repo yelemessov-sherniaz-student-api on GitHub first.
set -e
GH_USER="sherniazkz-boop"
git remote add origin https://github.com/$GH_USER/yelemessov-sherniaz-student-api.git
git tag v1.0-yelemessov-sherniaz
git push -u origin main
git push origin feature/yelemessov-sherniaz-crud feature/yelemessov-sherniaz-documentation
git push origin v1.0-yelemessov-sherniaz
git remote -v; git log --oneline --graph --all; git branch -a; git tag
