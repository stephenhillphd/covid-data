#! bin/bash
echo "sed worked"
sed 's/    */\t/g' test.txt> test2.txt

echo "remove dead lines"
head test2.txt
awk '$1 ~ /Demographics|Race|Missing|Cases|Age|Gender/ {next} {print}' test2.txt | awk '$1 ~ /Pacific|Ethnicity|Alaska/ {next} {print}' > test3.txt

#awk -F"\r" '{print $1}' test3.txt
head test3.txt
echo "final combo and write out results"
awk -F"\r" '{print $1}' test3.txt | awk 'NR==1{c=$0} !/^\t/{print c; c=$0} /^\t/{c=c ""$0} END{print c}' | grep "[0-9]" > demos_final.txt

head demos_final.txt
#awk '{print $0}' demos_final.txt

rm test2.txt test3.txt
