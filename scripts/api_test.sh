#!/bin/bash
URL=${1:-http://localhost:8080}
echo "== home";   curl -s $URL/; echo
echo "== create"; curl -s -i -X POST $URL/students -H 'Content-Type: application/json' \
  -d '{"firstName":"Sherniaz","lastName":"Yelemessov","email":"sherniaz.yelemessov@example.com"}'; echo
echo "== all";    curl -s $URL/students; echo
echo "== one";    curl -s $URL/students/1; echo
echo "== update"; curl -s -X PUT $URL/students/1 -H 'Content-Type: application/json' \
  -d '{"firstName":"Sherniaz","lastName":"Yelemessov","email":"updated.sherniaz@example.com"}'; echo
echo "== delete"; curl -s -i -X DELETE $URL/students/1 | head -1
echo "== nonexistent"; curl -s -i $URL/students/999
echo
