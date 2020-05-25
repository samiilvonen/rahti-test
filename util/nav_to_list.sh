nav_first_line="$(($(cat mkdocs.yml | grep "^nav:" -n | cut -d ":" -f1) +2 ))"
nav_end_line=$(($(tail -n +${nav_first_line} mkdocs.yml | grep "^[A-Z,a-z]\+:" -n | head -n 1 | cut -d ":" -f1 )-1))
list="$(tail -n +${nav_first_line} mkdocs.yml | head -n +${nav_end_line} | grep -v "^\s*#" | sed 's/: /: user_guide\//g' | sed 's/user_guide\/\s*$//g')"

echo "$list" | sed 's/user_guide.*/(&)/g' | sed 's/: /]/g'  | sed 's/]\s*$//g' | sed 's/[A-Z,a-z, ]*](/[&/g' | sed 's/-\[ /- \[/g' | sed 's/:\s*$//g' 

