#!bin/bash

cd /Desktop/week_2_cs699_25m2125

echo Number of files 
ls | wc -l

echo total disk usage
du -hs

echo detailed file listing
ls -rtl | tail -n +2




arr=("1" "2" "3" "4" "5")

for i in "${arr[@]}"; do
   for i in "${arr[@]}"; do
      echo -n "*"
   done  
   echo " " 
done      
  
  
  
  
  
  
var=10

while [ $var -ge 0 ]
do  
  for i in "${arr[@]}"; do
     echo -n "*"
  done
  echo " "     
  var=$(( $var - 1 ))
done  

