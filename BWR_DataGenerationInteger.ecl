// Generates integer benchmark file
#WORKUNIT('name', 'DataGenerationInteger1_3');
dataset_name := '~benchmark::integer::1GB_3'; 

totalrecs := 31250000 * 2;

unique_keys  := 100000; // Should be less than totalrecs
unique_fills :=  10212; // Should be less than totalrecs

rec := {INTEGER  key, INTEGER fill};
outdata := DATASET(totalrecs, 
                   TRANSFORM(rec, 
                             SELF.key  := RANDOM() % unique_keys; 
                             SELF.fill := RANDOM() % unique_fills;),
                   DISTRIBUTED); 

OUTPUT(outdata,,dataset_name,overwrite);

