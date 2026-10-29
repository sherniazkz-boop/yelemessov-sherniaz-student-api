#!/bin/bash
# Part 2 - run from project root. Edit EMAIL first. Creates history locally.
set -e
EMAIL="sherniaz.kz@gmail.com"
git init -b main
git config user.name "Sherniaz Yelemessov"
git config user.email "$EMAIL"
git add . && git commit -m "Initial commit: Sherniaz Yelemessov Student API"

# 2.2 feature branch
git checkout -b feature/yelemessov-sherniaz-crud
sed -i 's|return repo.findAll();|return repo.findAll(); // Sherniaz: list all students|' src/main/java/kz/sherniaz/studentapi/StudentController.java
git commit -am "Sherniaz Yelemessov: improve read-all CRUD operation"
printf '\n## Change by Sherniaz Yelemessov\nImproved the GET /students (read-all) operation.\n' >> README.md
git commit -am "Sherniaz Yelemessov: document CRUD improvement in README"
git checkout main && git merge --no-ff feature/yelemessov-sherniaz-crud -m "Merge feature/yelemessov-sherniaz-crud"

# 2.3 conflict on same README line in two branches
echo "Status: draft" >> README.md && git commit -am "Sherniaz Yelemessov: add status line"
git checkout -b feature/yelemessov-sherniaz-documentation
sed -i 's/^Status: draft/Status: documentation by Sherniaz Yelemessov/' README.md
git commit -am "Sherniaz Yelemessov: documentation branch edits status line"
git checkout main
sed -i 's/^Status: draft/Status: ready for release v1.0/' README.md
git commit -am "Sherniaz Yelemessov: main edits status line"
git merge feature/yelemessov-sherniaz-documentation || true
echo ">>> CONFLICT in README.md. Now: edit README.md manually (remove <<<<<<< ======= >>>>>>> markers),"
echo ">>> then run:  git add README.md && git commit -m 'Sherniaz Yelemessov: resolve README conflict'"
echo ">>> then run scripts/git_part2b.sh"
