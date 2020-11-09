
#grep only lists marked "L_" in dir
ls | grep "L_" > dir

fn="./dir"
  while IFS= read -r fname
  do
    cp "${fname}" linkle
    node linkbuilder.js > "${fname}G"
    mv "${fname}G" "${fname}"

done <"$fn"

rm dir
rm linkle
