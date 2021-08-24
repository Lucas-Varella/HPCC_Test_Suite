// Filter out even keys (key % 2 == 1) (String)
#WORKUNIT('name', 'CountWithFilterStr1');
dataset_name := '~benchmark::string::1GB';

rs := {STRING10 key, STRING90 fill};
outdata := DATASET(dataset_name, rs, FLAT);

OUTPUT(COUNT(NOFOLD(outdata(((INTEGER)key)%2=0))));
