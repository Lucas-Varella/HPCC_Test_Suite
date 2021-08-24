// Runs data checks. Comment/uncomment string/integer lines to switch between data type usage.
//#WORKUNIT('name', 'KeyAndFillCounts_Int');
#WORKUNIT('name', 'KeyAndFillCounts_Str');

//rs_int := {integer key, integer fill};
rs_str := {string10 key, string90 fill};

//ds_int := DATASET('~benchmark::integer::1GB_3', rs_int, FLAT);

ds_str := DATASET('~benchmark::string::1GB', rs_str, FLAT);

//C_int := COUNT(TABLE(ds_int,{key},key, MERGE));

C_str := COUNT(TABLE(ds_str,{key},key));

//OUTPUT(C_int,NAMED('C_int_countKey'));

OUTPUT(C_str,NAMED('C_str_countKey'));

//C_int1 := COUNT(TABLE(ds_int,{fill},fill, MERGE));

C_str1 := COUNT(TABLE(ds_str,{fill},fill));

//OUTPUT(C_int1,NAMED('C_int1_countFill'));

OUTPUT(C_str1,NAMED('C_str1_countFill'));

