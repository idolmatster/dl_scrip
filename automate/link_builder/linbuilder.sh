
#get dir
ls > dir

#grep only lists
grep "L_" dir > dir2 && mv dir2 dir

fn="./dir"
  while IFS= read -r fname
  do
    cp "${fname}" linkle
    node linkbuilder.js > "${fname}G"
    mv "${fname}G" "${fname}"

done <"$fn"

rm dir
rm linkle
