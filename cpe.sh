#Author : MuzammilM
#Copies files excluding the ones passed as argument

COLOR='\033[0;31m'
reset=`tput sgr0`

if [ $# -lt 1 ]
then
        echo -e "${COLOR}No arguments passed."
        echo -e "${COLOR}Copies files excluding the ones passed as argument"
        echo -e "${COLOR}Execution : cpe srcDir destDir \"excludeDir\" ${reset}"
        exit
fi

mkdir -p $2
ignore=`echo $3 | sed 's/,/\\\|/g'`
z=`ls $1 | grep -v "$ignore"`
for file in $z
do
echo $file
cp -r $1/$file $2/
done
