#!/bin/bash

binFiles='executable* *.exe *.deb'
incFiles="*.h *.hxx"
srcFiles='*.c *.cxx *.cpp *.cc'

folders='bin lib src inc'
o='organize'

touch $o.log

echo "you want to change the name of organize.log : "
read -p  "[y/n] :" -t 5 yn

if [ $yn == 'y' ];
then
read -p -t 5 "give new $o name " org 
fi
if [ ! -z $org ];
then
o=$org
echo "start $o" > $o.log
else
echo "start $o" > $o.log
fi
pathDir=$1

if [ -z "$pathDir" ];
then
    read -p  "give a directory to store : " -t 5 path

    findPath=$(find "$(cd ..; pwd)" -name "$pathDir")
    echo $findPath
    #ls $findPath
    basepath=$(basename $findPath)

elif [ ! -z "$pathDir"];
then
    findPath=$(find "$(cd ..; pwd)" -name "$pathDir")
    echo $findPath
    #ls $findPath
    basepath=$(basename $findPath)
else
    findPath=$(find "$(cd ..; pwd)" -name "testfiles")
fi

echo "do tou want to replace ${folders[@]}  directories ? "
read   5 " [y/n]: " -p -t var
if [ $var == 'y' ];
then
   for i in ${folders[@]}; do
        echo "replace $i with: "
	    read  -t 5 iPlace
	    mv $i $iPlace
	    echo " $i changed to: $iPlace"
	done   
           
fi

 

for f in $folders; do
	mkdir -p $f
    basef=$(basename $f)
    dirf="$(dirname $f)" 
    totFile=(`find $f -type f`); 
	if [ $f == 'bin' ]; 
    then
      echo $f
      
       for ex in $binFiles; do
         
         find $findPath  -type f -name $ex   | while read file;
            do
              basefile=$(basename $file)
               dirfile="$(dirname $file)"
                
                    
                if [[ -f "$f/$(basename $file)" ]];
                then
                    echo "the $file already moved to $f "
                    #whrite " < /dev/tty " because doesn't stop
                    read -p  "do you want to change the name [y/n]:" -t 5 yesOno < /dev/tty

                    if [ $yesOno == 'y' ];
                    then
                        read -p  "give new name: " -t 5 new < /dev/tty
                        echo "$new"
                        mv $file $(basename $new)
                        mv $new $basef
                        echo "$new-$f" >> $o.log
                    else
                        continue
                    fi
                elif [[ ! -f "$f/$(basename $file)" ]];
                then
                 mv $file $basef
                 echo "$file-$f" >> $o.log
                fi
              
       
            done
       
        done
    elif [ $f == 'lib' ]; 
    then
	    
        echo $f 
     
         
         find $findPath  -type f -name 'lib*'   | while read file;
            do
              basefile=$(basename $file)
               dirfile="$(dirname $file)"
                
                    
                if [[ -f "$f/$(basename $file)" ]];
                then
                    echo "the $file already moved to $f "
                    #whrite " < /dev/tty " because doesn't stop
                    read -p  "do you want to change the name [y/n]:" -t 5 yesOno < /dev/tty

                    if [ $yesOno == 'y' ];
                    then
                        read -p  "give new name: " -t 5 new < /dev/tty
                        echo "$new"
                        mv $file $(basename $new)
                        mv $new $basef
                        echo "$new-$f" >> $o.log
                    else
                        continue
                    fi
                elif [[ ! -f "$f/$(basename $file)" ]];
                then
                 mv $file $basef
                 echo "$file-$f" >> $o.log
                
                fi
              
       
            done
       
        

    elif [ $f == 'src' ]; 
    then

        echo $f 
        for ex in $srcFiles; do
         
         find $findPath  -type f -name $ex   | while read file;
            do
              basefile=$(basename $file)
               dirfile="$(dirname $file)"
                
                    
                if [[ -f "$f/$(basename $file)" ]];
                then
                    echo "the $file already moved to $f "
                    #whrite " < /dev/tty " because doesn't stop
                    read -p  "do you want to change the name [y/n]:" -t 5 yesOno < /dev/tty

                    if [ $yesOno == 'y' ];
                    then
                        read -p  "give new name: " -t 5 new < /dev/tty
                        echo "$new"
                        mv $file $(basename $new)
                        mv $new $basef
                        echo "$new-$f" >> $o.log
                    else
                        continue
                    fi
                elif [[ ! -f "$f/$(basename $file)" ]];
                then
                 mv $file $basef
                 echo "$file-$f" >> $o.log
                fi
              
       
            done
        done

    elif [ $f == 'inc' ];
    then

        echo $f 
        for ex in $incFiles; do
         
         find $findPath  -type f -name $ex  | while read file;
            do
              basefile=$(basename $file)
               dirfile="$(dirname $file)"
                
                    
                if [[ -f "$f/$(basename $file)" ]];
                then
                    echo "the $file already moved to $f "
                    #whrite " < /dev/tty " because doesn't stop
                    read -p  "do you want to change the name [y/n]:" -t 5 yesOno < /dev/tty

                    if [ $yesOno == 'y' ];
                    then
                        read -p "give new name: " -t 5 new < /dev/tty
                        echo "$new"
                        mv $file $(basename $new)
                        mv $new $basef
                        echo "$new-$f" >> $o.log
                    else
                        continue
                    fi
                elif [[ ! -f "$f/$(basename $file)" ]];
                then
                 mv $file $basef
                 echo "$file-$f" >> $o.log
                fi
              
       
            done
            #FILES=(`find $f -type f`); echo "Total number of directories were processed :"${#FILES[@]}
        done

    fi 

    if [ $f == 'bin' ]; 
    then
    totFile=(`find $f -type f`); echo "Total number of files in $f : "${#totFile[@]}
    fi 

    
    let "myvar=1" "myvar2=myvar++" ; 
  
	
done
let "myvar=1";
for f in $folders; do
 FILES=(`find $f -type f`); echo "Total number of files in $f : "${#FILES[@]}
    let  "myvar2=myvar++" ;
    done 
echo "Total number of directories were processed : $myvar2"


#findPath="$(dirname $path)" 
#basepath=$(basename $path)

