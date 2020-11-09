ls | grep "L_" > dir

sort index > tmp && mv tmp index

#run through files
fn="./dir"
  while IFS= read -r fname
  do
    linecount=$(< ${fname} wc -l)
    echo "\"${fname}\" - (${linecount}) "
done <"$fn"

rm dir