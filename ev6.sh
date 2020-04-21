IFS='
'
contador=0
frasefinal="El grupo que tiene más usuario es: "
grupomax=0

read -p "Introduce el nombre de un fichero: " valor

while [ ! -f "$valor" ]; do

echo "El fichero introducido no existe"
read -p "Introduce el nombre de un fichero: " valor

done

echo "En el fichero proporcionado tenemos" $(cat $valor|grep -c ' ')" grupos: "

for i in $(cat $valor); do
contador=0
IFS=' '
nombre=""

for x in $i; do

if [ -z "$nombre" ]; then
nombre=$x
fi

contador=`expr $contador + 1`

done

if [ $grupomax -lt $contador ];then
grupomax=$contador
echo $i > nombremax.txt

else
if [  $grupomax -eq $contador ];then
echo $i >> nombremax.txt

fi

fi

echo $nombre  `expr $contador - 1`
IFS=$'\n'

done

if [ $(cat nombremax.txt |grep -c ' ') -gt 1 ]; then
echo "Estos son los grupos que tienen el mismo numero de usuarios: "
echo $(cat nombremax.txt)
else

echo "El grupo que tiene más usuarios es " $(echo $(cat nombremax.txt) | awk '{print $1}' )
fi





