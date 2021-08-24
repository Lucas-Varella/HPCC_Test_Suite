// Filter out even keys (key % 2 == 1) (Integer)
#WORKUNIT('name', 'CountWithFilterInt1');
dataset_name := '~benchmark::integer::1GB_3';

rs := {INTEGER key, INTEGER fill};
outdata := DATASET(dataset_name, rs, FLAT);

OUTPUT(COUNT(NOFOLD(outdata(fill%2=0))));

