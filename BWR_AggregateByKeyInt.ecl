// Dataset Aggregation (Integer)
// Group the dataset by key and then perform a count aggregation to determine number of values associated with each key.
// Count to force execution.

#WORKUNIT('name', 'AggregateByKeyInt1');
dataset_name := '~benchmark::integer::1GB_3';

rs := {integer key, integer fill};
outdata := DATASET(dataset_name, rs, FLAT);

outdata1 := TABLE(outdata, {key, fill}, key, fill, FEW);
outdata2 := TABLE(outdata1, {key, COUNT(GROUP)}, key, FEW);

OUTPUT(COUNT(NOFOLD(outdata1)));
