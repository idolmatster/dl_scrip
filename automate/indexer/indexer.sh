ls | grep "L_" > dir

#clear index
> index

#run through files
fn="./dir"
  while IFS= read -r fname
  do
    linecount=$(< ${fname} wc -l)
    echo "\"${fname}\" - (${linecount}) " >>index
done <"$fn"

rm dir