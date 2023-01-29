# Download .CSVs and unzip when needed

mkdir "../data"

for ((year=2005;year<=2016;year++)); do

    wget -P ../data "dadosabertos.mec.gov.br/arquivos/prouni/bolsista/pda-prouni-"$year".csv" 
    mv "../data/pda-prouni-"$year".csv" "../data/pda_prouni_"$year".csv"

done

for ((year=2017;year<=2019;year++)); do
    if ! (wget -P ../data "dadosabertos.mec.gov.br/images/conteudo/prouni/"$year"/pda-prouni-"$year".csv");
    then
        wget -P ../data "dadosabertos.mec.gov.br/images/conteudo/prouni/"$year"/pda-prouni-"$year".zip"
        unzip "../data/pda-prouni-"$year".zip" -d "../data"
        mv "../data/pda-prouni-"$year".csv" "../data/pda_prouni_"$year".csv"
    fi 
done

mv ../data/pda-prouni-2018.csv ../data/pda_prouni_2018.csv

wget -P ../data "dadosabertos.mec.gov.br/images/conteudo/prouni/2020/ProuniRelatorioDadosAbertos2020.csv"
mv ../data/ProuniRelatorioDadosAbertos2020.csv ../data/pda_prouni_2020.csv

# Create DB and tables

endpoint=$(aws rds --region eu-central-1 describe-db-instances --query "DBInstances[*].Endpoint.Address" | grep '.*prounidb.*' | sed 's/[ \"]//g')

echo "CREATE DATABASE prouni" | mysql -u admin -pmypassword -h $endpoint

for file in ../createTablesDB/* ; do
    if ! [ "$file" == "createUnifiedTable.sql" ];
    then
        mysql -u admin -pmypassword -h $endpoint prouni < $file;
    fi
done

# Populate tables

for file in ../data/*; do

    if ! [[ "${file: -4}" == ".zip" ]]
    then
        mysqlimport --local --compress -u admin -pmypassword -h $endpoint prouni --fields-terminated-by=';' --ignore-lines=1 $file
    fi
done

mysql -u admin -pmypassword -h $endpoint prouni < ../createTablesDB/createUnifiedTable.sql;