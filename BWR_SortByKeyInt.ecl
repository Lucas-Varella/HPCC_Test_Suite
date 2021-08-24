// Sort (Integer)
// Count to force execution.

#WORKUNIT('name', 'SortByKeyInt1');
dataset_name := '~benchmark::integer::1GB_3';

rs := {INTEGER key, INTEGER fill};
outdata := DATASET(dataset_name, rs, THOR);

outdata1 := SORT(outdata, key);

OUTPUT(COUNT(NOFOLD(outdata1)));

