// Sort (String)
// Count to force execution.

#WORKUNIT('name', 'SortByKeyStr1');
dataset_name := '~benchmark::string::1GB';

rs_str := {STRING10 key, STRING90 fill};
outdata := DATASET(dataset_name, rs_str, FLAT);

outdata1 := SORT(outdata, key);

OUTPUT(COUNT(NOFOLD(outdata1)));
