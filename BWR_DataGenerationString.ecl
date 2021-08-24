// Generates string benchmark file
#WORKUNIT('name', 'DataGenerationString1');
dataset_name := '~benchmark::string::1GB'; 
totalrecs := 10000000;

rec := {STRING10  key, STRING90  fill};

unique_keys  := 100000; // Should be less than totalrecs
unique_fills :=  10212; // Should be less than totalrecs

//Key data generation, just the unique_keys:
STRING10 gen_key() := INTFORMAT((RANDOM() % unique_keys)+1,10,1);

//Fill data generation, just the unique_fills:
STRING1  gen_1()    := (>string1<)(48 + (RANDOM() % 10));  //chars 0-9
STRING10 gen_10()   := gen_1() + gen_1() + gen_1() + 
                       gen_1() + gen_1() + gen_1() + 
                       gen_1() + gen_1() + gen_1() +
                       gen_1();
STRING90 gen_fill() := gen_10() + gen_10() + gen_10() + 
                       gen_10() + gen_10() + gen_10() + 
                       gen_10() + gen_10() + gen_10();
FillData := DEDUP(SORT(DATASET(unique_fills * 2, 
                               TRANSFORM({string90  fill}, 
                                         SELF.fill := gen_fill()), 
                               DISTRIBUTED),
                       fill),
                 fill)[..unique_fills];
//Dataset generation:
outdata := DATASET(totalrecs, 
                   TRANSFORM(rec, 
                             SELF.key  := gen_key(), 
                             SELF.fill := FillData[(RANDOM() % unique_fills)+1].fill), 
                   DISTRIBUTED);
OUTPUT(outdata,,dataset_name,OVERWRITE);