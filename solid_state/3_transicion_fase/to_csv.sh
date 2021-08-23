
# Convert txt data files into csv

DATA_PATH=data

for i in $(ls $DATA_PATH/*/*); 
    do
    # dinamica, distribucion
    sed -i 's/X\s/X_/g' $i
    sed -i 's/Y\s/Y_/g' $i
    # energias
    sed -i 's/Promedio Temporal/promedio_temporal/g' $i
    sed -i 's/Energía en cada paso/energia_en_cada_paso/g' $i
    # rdf
    sed -i 's/r\s/r_/g' $i
    # espacios entre números
    sed -i 's/\s/,/g' $i
    mv $i $i.csv
done