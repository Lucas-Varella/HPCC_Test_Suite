// Dataset Aggregation (String)
// Group the dataset by key and then perform a count aggregation to determine number of values associated with each key.
// Count to force execution.

#WORKUNIT('name', 'AggregateByKeyStr1');
dataset_name := '~benchmark::string::1GB';

rs := {string10 key, string90 fill};
outdata := DATASET(dataset_name, rs, FLAT);

outdata1 := TABLE(outdata, {key, fill}, key, fill, FEW);
outdata2 := TABLE(outdata1, {key, COUNT(GROUP)}, key, FEW);

OUTPUT(COUNT(NOFOLD(outdata2)));