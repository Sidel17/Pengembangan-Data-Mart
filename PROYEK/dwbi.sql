CREATE DATABASE projectDWBI


USE projectDWBI


/*Table structure for table `dim_anggaran` */
/*DROP TABLE dim_anggaran;*/

CREATE TABLE dim_anggaran (
  kode_anggaran varchar(6) NOT NULL,
  penanggung_jawab varchar(50) NOT NULL,
  nama_kegiatan varchar(110) NOT NULL,
  nama_atasan varchar(40) NOT NULL,
  jumlah_anggaran_kegiatan varchar(25) NOT NULL,
  nama_keuangan varchar(19) NOT NULL,
  pk_anggaran bigint NOT NULL,
  PRIMARY KEY (pk_anggaran)
) 

/*Data for the table `dim_anggaran` */



/*Table structure for table `dim_date` */
/*DROP TABLE dim_date;*/

CREATE TABLE dim_date (
  pk_date smallint NOT NULL,
  day_number smallint NOT NULL,
  year_number smallint NOT NULL,
  month_number smallint NOT NULL,
  day_name nvarchar(10) NOT NULL,
  weekend_ind char(3) NOT NULL,
  week_name char(3) NOT NULL,
  PRIMARY KEY (pk_date)
) 

/*Data for the table `dim_date` */

/*Table structure for table `dim_kegiatan` */

CREATE TABLE dim_kegiatan (
  id_kegiatan varchar(6) NOT NULL,
  sequence bigint NOT NULL,
  nama_kegiatan varchar(102) NOT NULL,
  person_int_charge varchar(50) NOT NULL,
  hari_pelaksanaan bigint DEFAULT NULL,
  bulan_pelaksanaan bigint DEFAULT NULL,
  tahun_pelaksanaan bigint DEFAULT NULL,
  pk_kegiatan bigint NOT NULL,
  PRIMARY KEY (pk_kegiatan)
) 


/*Data for the table `dim_kegiatan` */


/*Table structure for table `dim_rka` */
/*DROP TABLE dim_proker;*/

CREATE TABLE dim_proker (
	kode_proker varchar(6) NOT Null,
	nama_kegiatan varchar(110) NOT Null,
	nama_himpunan varchar(12) NOT Null,
	nama_ketua_himpunan varchar(30) NOT Null,
	lama_pelaksanaan bigint NOT NULL,
	total_dana varchar(12) NOT Null,
	jumlah_peserta bigint NOT NULL,
	pk_proker bigint NOT NULL,
	PRIMARY KEY (pk_proker)
) 

/*Data for the table `dim_rka` */


/*Table structure for table `dim_unit` */


CREATE TABLE dim_himapro (
  kode_himapro varchar(5) NOT NULL,
  nama_himapro varchar(28) DEFAULT NULL,
  nama_ketua varchar(64) DEFAULT NULL,
  pk_himapro bigint NOT NULL,
  PRIMARY KEY (pk_himapro)
) 

/*Data for the table `dim_unit` */

/*Table structure for table `dim_fact_pendanaan` */
/*DROP TABLE dim_fact_pencairan_dana;
DROP TABLE dim_fact_pengajuan_dana;
DROP TABLE dim_fact_realisasi_kegiatan;*/

CREATE TABLE fact_pencairan_dana (
  fk_himapro bigint NOT NULL,
  fk_kegiatan bigint NOT NULL,
  fk_anggaran bigint NOT NULL,
  fk_proker bigint NOT NULL,
  fk_date smallint NOT NULL,
  jumlah_uang_diterima bigint not NULL,

  CONSTRAINT FK2_dim_fact_pencairan_dana FOREIGN KEY (fk_kegiatan) REFERENCES dim_kegiatan (pk_kegiatan),
  CONSTRAINT FK3_dim_fact_pencairan_dana FOREIGN KEY (fk_proker) REFERENCES dim_proker (pk_proker),
  CONSTRAINT FK4_dim_fact_pencairan_dana FOREIGN KEY (fk_himapro) REFERENCES dim_himapro (pk_himapro),
  CONSTRAINT FK6_dim_fact_pencairan_dana FOREIGN KEY (fk_date) REFERENCES dim_date (pk_date),
  CONSTRAINT FK_dim_fact_pencairan_dana FOREIGN KEY (fk_anggaran) REFERENCES dim_anggaran (pk_anggaran)
) 


CREATE TABLE fact_pengajuan_dana (
  fk_himapro bigint NOT NULL,
  fk_proker bigint NOT NULL,
  fk_kegiatan bigint NOT NULL,
  fk_anggaran bigint NOT NULL,
  fk_date smallint NOT NULL,
  jumlah_dana_diajukan bigint NOT NULL,
 
  CONSTRAINT FK7_dim_fact_pengajuan_dana FOREIGN KEY (fk_kegiatan) REFERENCES dim_kegiatan (pk_kegiatan),
  CONSTRAINT FK8_dim_fact_pengajuan_dana FOREIGN KEY (fk_proker) REFERENCES dim_proker (pk_proker),
  CONSTRAINT FK9_dim_fact_pengajuan_dana FOREIGN KEY (fk_himapro) REFERENCES dim_himapro (pk_himapro),
  CONSTRAINT FK10_dim_fact_pengajuan_dana FOREIGN KEY (fk_date) REFERENCES dim_date (pk_date),
  CONSTRAINT FK11_dim_fact_pengajuan_dana FOREIGN KEY (fk_anggaran) REFERENCES dim_anggaran (pk_anggaran)
) 


CREATE TABLE fact_realisasi_kegiatan (
  fk_himapro bigint NOT NULL,
  fk_proker bigint NOT NULL,
  fk_kegiatan bigint NOT NULL,
  fk_anggaran bigint NOT NULL,
  fk_date smallint NOT NULL,
  jumlah_uang_diajukan bigint not NULL,
  jumlah_uang_diterima bigint not NULL,
  jumlah_uang_digunakan bigint not NULL,
  jumlah_uang_dikembalikan bigint not NULL,
  jumlah_peserta bigint not NULL,
  jumlah_panitia bigint not NULL,

  CONSTRAINT FK12_dim_fact_pengajuan_dana FOREIGN KEY (fk_kegiatan) REFERENCES dim_kegiatan (pk_kegiatan),
  CONSTRAINT FK13_dim_fact_pengajuan_dana FOREIGN KEY (fk_proker) REFERENCES dim_proker (pk_proker),
  CONSTRAINT FK14_dim_fact_pengajuan_dana FOREIGN KEY (fk_himapro) REFERENCES dim_himapro (pk_himapro),
  CONSTRAINT FK15_dim_fact_pengajuan_dana FOREIGN KEY (fk_date) REFERENCES dim_date (pk_date),
  CONSTRAINT FK16_dim_fact_pengajuan_dana FOREIGN KEY (fk_anggaran) REFERENCES dim_anggaran (pk_anggaran)
) 
