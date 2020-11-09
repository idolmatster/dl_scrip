
#get dir
ls > dir

#grep only lists
grep "L_" dir > dir2 && mv dir2 dir

fn="./dir"
  while IFS= read -r fname
  do
    sed -i 's/+/%2B/g' "${fname}"
    sed -i 's/&/%26/g' "${fname}"
done <"$fn"

rm dir
