-- buat tabel baru timezone untuk bantuan
CREATE TABLE us_tz 
(
    state_name	VARCHAR(512),
    timezone	VARCHAR(512)
);

INSERT INTO us_tz (state_name, timezone) VALUES ('Alabama', 'CST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Alaska', 'AKST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Arizona', 'MST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Arkansas', 'CST');
INSERT INTO us_tz (state_name, timezone) VALUES ('California', 'PST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Colorado', 'MST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Connecticut', 'EST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Delaware', 'EST');
INSERT INTO us_tz (state_name, timezone) VALUES ('District of Columbia', 'EST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Florida', 'EST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Georgia', 'EST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Hawaii', 'HST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Idaho', 'MST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Illinois', 'CST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Indiana', 'EST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Iowa', 'CST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Kansas', 'CST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Kentucky', 'CST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Louisiana', 'CST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Maine', 'EST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Maryland', 'EST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Massachusetts', 'EST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Michigan', 'EST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Minnesota', 'CST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Mississippi', 'CST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Missouri', 'CST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Montana', 'MST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Nebraska', 'CST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Nevada', 'PST');
INSERT INTO us_tz (state_name, timezone) VALUES ('New Hampshire', 'EST');
INSERT INTO us_tz (state_name, timezone) VALUES ('New Jersey', 'EST');
INSERT INTO us_tz (state_name, timezone) VALUES ('New Mexico', 'MST');
INSERT INTO us_tz (state_name, timezone) VALUES ('New York', 'EST');
INSERT INTO us_tz (state_name, timezone) VALUES ('North Carolina', 'EST');
INSERT INTO us_tz (state_name, timezone) VALUES ('North Dakota', 'CST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Ohio', 'EST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Oklahoma', 'CST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Oregon', 'PST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Pennsylvania', 'EST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Rhode Island', 'EST');
INSERT INTO us_tz (state_name, timezone) VALUES ('South Carolina', 'EST');
INSERT INTO us_tz (state_name, timezone) VALUES ('South Dakota', 'CST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Tennessee', 'CST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Texas', 'CST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Utah', 'MST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Vermont', 'EST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Virginia', 'EST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Washington', 'PST');
INSERT INTO us_tz (state_name, timezone) VALUES ('West Virginia', 'EST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Wisconsin', 'CST');
INSERT INTO us_tz (state_name, timezone) VALUES ('Wyoming', 'MST');

-- No 1
select type_of_intersection_name,light_condition_name,atmospheric_conditions_1_name,count(consecutive_number) as jumlah_kecelakaan
from (
	select * ,
	CASE
		when state_name = 'Alaska' then timestamp_of_crash at time zone 'AKST'
		when state_name IN(select state_name from us_tz where timezone='CST') then timestamp_of_crash at time zone 'CST'
		when state_name IN(select state_name from us_tz where timezone='EST') then timestamp_of_crash at time zone 'EST'
		when state_name IN(select state_name from us_tz where timezone='HST') then timestamp_of_crash at time zone 'HST'
		when state_name IN(select state_name from us_tz where timezone='MST') then timestamp_of_crash at time zone 'MST'
		when state_name IN(select state_name from us_tz where timezone='PST') then timestamp_of_crash at time zone 'PST'
	END as real_time_of_crash 	
	from crash
) x 
where x.real_time_of_crash BETWEEN '2021-01-01' and '2022-01-01'
AND x.manner_of_collision_name != 'Not Reported'
AND x.land_use_name != 'Unknown'
group by type_of_intersection_name,light_condition_name,atmospheric_conditions_1_name
order by count(consecutive_number) desc
limit 20;

-- No 2
select state_name,count(consecutive_number) as jumlah_kecelakaan
from (
	select * ,
	CASE
		when state_name = 'Alaska' then timestamp_of_crash at time zone 'AKST'
		when state_name IN(select state_name from us_tz where timezone='CST') then timestamp_of_crash at time zone 'CST'
		when state_name IN(select state_name from us_tz where timezone='EST') then timestamp_of_crash at time zone 'EST'
		when state_name IN(select state_name from us_tz where timezone='HST') then timestamp_of_crash at time zone 'HST'
		when state_name IN(select state_name from us_tz where timezone='MST') then timestamp_of_crash at time zone 'MST'
		when state_name IN(select state_name from us_tz where timezone='PST') then timestamp_of_crash at time zone 'PST'
	END as real_time_of_crash 	
	from crash
) x 
where x.real_time_of_crash BETWEEN '2021-01-01' and '2022-01-01'
AND x.manner_of_collision_name != 'Not Reported'
AND x.land_use_name != 'Unknown'
group by state_name
order by count(consecutive_number) desc
limit 10;

-- No 3
WITH tabel_crash_baru0 as (
			select * ,
	CASE
		when state_name = 'Alaska' then timestamp_of_crash at time zone 'AKST'
		when state_name IN(select state_name from us_tz where timezone='CST') then timestamp_of_crash at time zone 'CST'
		when state_name IN(select state_name from us_tz where timezone='EST') then timestamp_of_crash at time zone 'EST'
		when state_name IN(select state_name from us_tz where timezone='HST') then timestamp_of_crash at time zone 'HST'
		when state_name IN(select state_name from us_tz where timezone='MST') then timestamp_of_crash at time zone 'MST'
		when state_name IN(select state_name from us_tz where timezone='PST') then timestamp_of_crash at time zone 'PST'
	END as real_time_of_crash 	
	from crash 
), tabel_crash_baru as ( 
	select * from tabel_crash_baru0
		where real_time_of_crash BETWEEN '2021-01-01' and '2022-01-01'
		AND manner_of_collision_name != 'Not Reported'
		AND land_use_name != 'Unknown') , 
tabel_total_hari as (select ceil((extract('epoch' from (MAX(real_time_of_crash) - MIN(real_time_of_crash))))/3600/24) as total_hari from tabel_crash_baru where real_time_of_crash BETWEEN '2021-01-01' and '2022-01-01'), 
tabel_jumlah_kecelakaan as (
	select TO_CHAR(real_time_of_crash, 'YYYY-MM-DD') as tanggal, 
		extract(hour from real_time_of_crash) as jam, count(consecutive_number) as jumlah_kecelakaan,
		total_hari
	from tabel_crash_baru, tabel_total_hari
	group by real_time_of_crash, total_hari
	order by real_time_of_crash
),
subquery_akhir as (
	select tanggal, jam, sum(jumlah_kecelakaan) as jumlah_kecelakaan, total_hari 
	from tabel_jumlah_kecelakaan
	group by tanggal, jam, total_hari
	order by tanggal, jam
	)
select TO_CHAR(concat(jam::int,' hour')::interval,'HH24:MI') as jam, 
	(sum(jumlah_kecelakaan)/total_hari) as rata2_jumlah_kecelakaan_per_hari
from subquery_akhir
group by jam, total_hari
order by jam

-- No 4
select round(jumlah_pengemudi_mabuk*100/jumlah_total,2) as persentase_kecelakaan_pengemudi_mabuk,
	round(jumlah_pengemudi_tidak_mabuk*100/jumlah_total,2) as persentase_kecelakaan_pengemudi_tidak_mabuk
from (
	select count(*)::numeric as jumlah_total,
		(select count(*)::numeric from crash where number_of_drunk_drivers != 0) as jumlah_pengemudi_mabuk,
		(select count(*)::numeric from crash where number_of_drunk_drivers = 0) as jumlah_pengemudi_tidak_mabuk
	from (
		select * ,
	CASE
		when state_name = 'Alaska' then timestamp_of_crash at time zone 'AKST'
		when state_name IN(select state_name from us_tz where timezone='CST') then timestamp_of_crash at time zone 'CST'
		when state_name IN(select state_name from us_tz where timezone='EST') then timestamp_of_crash at time zone 'EST'
		when state_name IN(select state_name from us_tz where timezone='HST') then timestamp_of_crash at time zone 'HST'
		when state_name IN(select state_name from us_tz where timezone='MST') then timestamp_of_crash at time zone 'MST'
		when state_name IN(select state_name from us_tz where timezone='PST') then timestamp_of_crash at time zone 'PST'
	END as real_time_of_crash 	
	from crash
) x 
where x.real_time_of_crash BETWEEN '2021-01-01' and '2022-01-01'
AND x.manner_of_collision_name != 'Not Reported'
AND x.land_use_name != 'Unknown'
) y

-- No 5
select round(jumlah_pedesaan*100/jumlah_total,2) as persentase_kecelakaan_pedesaan,
	round(jumlah_perkotaan*100/jumlah_total,2) as persentase_kecelakaan_perkotaan
from (
	select count(*)::numeric as jumlah_total,
			(select count(*)::numeric from crash where land_use_name ='Rural') as jumlah_pedesaan,
			(select count(*)::numeric from crash where land_use_name ='Urban') as jumlah_perkotaan
	from (
		select * ,
	CASE
		when state_name = 'Alaska' then timestamp_of_crash at time zone 'AKST'
		when state_name IN(select state_name from us_tz where timezone='CST') then timestamp_of_crash at time zone 'CST'
		when state_name IN(select state_name from us_tz where timezone='EST') then timestamp_of_crash at time zone 'EST'
		when state_name IN(select state_name from us_tz where timezone='HST') then timestamp_of_crash at time zone 'HST'
		when state_name IN(select state_name from us_tz where timezone='MST') then timestamp_of_crash at time zone 'MST'
		when state_name IN(select state_name from us_tz where timezone='PST') then timestamp_of_crash at time zone 'PST'
	END as real_time_of_crash 	
	from crash
) x 
where x.real_time_of_crash BETWEEN '2021-01-01' and '2022-01-01'
AND x.manner_of_collision_name != 'Not Reported'
AND x.land_use_name != 'Unknown'	
) y

-- No 6
with subquery1 as (select * ,
	CASE
		when state_name = 'Alaska' then timestamp_of_crash at time zone 'AKST'
		when state_name IN(select state_name from us_tz where timezone='CST') then timestamp_of_crash at time zone 'CST'
		when state_name IN(select state_name from us_tz where timezone='EST') then timestamp_of_crash at time zone 'EST'
		when state_name IN(select state_name from us_tz where timezone='HST') then timestamp_of_crash at time zone 'HST'
		when state_name IN(select state_name from us_tz where timezone='MST') then timestamp_of_crash at time zone 'MST'
		when state_name IN(select state_name from us_tz where timezone='PST') then timestamp_of_crash at time zone 'PST'
	END as real_time_of_crash 	
	from crash
), subquery2 as 
	(select * from subquery1
		where real_time_of_crash BETWEEN '2021-01-01' and '2022-01-01'
		AND manner_of_collision_name != 'Not Reported'
		AND land_use_name != 'Unknown')
select extract(dow from real_time_of_crash) as kode_hari,to_char(real_time_of_crash,'Day') as hari,
		count(consecutive_number) as jumlah_kecelakaan from subquery2
		group by kode_hari,hari
		order by kode_hari, hari desc
		



	

-- TAMBAHAN PARAMETER (RATA-RATA JUMLAH KECELAKAAN HARI MINGGU-SABTU TIAP JAM NYA)
WITH tabel_crash_baru0 as (
			select * ,
	CASE
		when state_name = 'Alaska' then timestamp_of_crash at time zone 'AKST'
		when state_name IN(select state_name from us_tz where timezone='CST') then timestamp_of_crash at time zone 'CST'
		when state_name IN(select state_name from us_tz where timezone='EST') then timestamp_of_crash at time zone 'EST'
		when state_name IN(select state_name from us_tz where timezone='HST') then timestamp_of_crash at time zone 'HST'
		when state_name IN(select state_name from us_tz where timezone='MST') then timestamp_of_crash at time zone 'MST'
		when state_name IN(select state_name from us_tz where timezone='PST') then timestamp_of_crash at time zone 'PST'
	END as real_time_of_crash 	
	from crash 
), tabel_crash_baru as ( 
	select * from tabel_crash_baru0
		where real_time_of_crash BETWEEN '2021-01-01' and '2022-01-01'
		AND manner_of_collision_name != 'Not Reported'
		AND land_use_name != 'Unknown'),
tabel_date1 as (
select MAX(real_time_of_crash) as data_terlama, MIN(real_time_of_crash) as data_terawal from tabel_crash_baru),
tabel_total_hari0 as 
(SELECT extract(dow from date_trunc('day', dd):: date) as kode_hari,
 to_char(date_trunc('day', dd):: date,'Day') as hari,1 as kejadian
FROM tabel_date1,generate_series
        ( data_terawal::timestamp 
        , data_terlama::timestamp
        , '1 day'::interval) dd),
tabel_total_hari as
(select kode_hari,hari,count(kejadian) as total_hari from tabel_total_hari0
group by kode_hari,hari),
tabel_jumlah_kecelakaan0 as
(select TO_CHAR(real_time_of_crash, 'YYYY-MM-DD') as tanggal, extract(dow from real_time_of_crash) as kode_hari,to_char(real_time_of_crash,'Day') as hari,
		extract(hour from real_time_of_crash) as jam, count(consecutive_number) as jumlah_kecelakaan
	from tabel_crash_baru 
	group by real_time_of_crash
	order by real_time_of_crash),
tabel_jumlah_kecelakaan as
(select a.kode_hari,a.hari,a.jam,a.jumlah_kecelakaan,b.total_hari
from tabel_jumlah_kecelakaan0 as a
right join
tabel_total_hari as b
on a.hari = b.hari),
subquery_akhir as (
	select kode_hari,hari,jam, sum(jumlah_kecelakaan) as jumlah_kecelakaan, total_hari 
	from tabel_jumlah_kecelakaan
	group by kode_hari,hari,jam, total_hari
	order by kode_hari,hari,jam
	)
select hari,TO_CHAR(concat(jam::int,' hour')::interval,'HH24:MI') as jam, 
	(sum(jumlah_kecelakaan)/total_hari) as rata2_jumlah_kecelakaan_per_hari
from subquery_akhir
group by kode_hari,hari,jam, total_hari
order by kode_hari,jam