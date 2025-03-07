CREATE OR REPLACE ICEBERG TABLE ICYTRANSCOME (
	TITLE STRING,
	DESCRIPTION STRING,
	PUBDATE STRING,
	POINT STRING,
	LATITUDE STRING,
	TS STRING,
	LONGITUDE STRING,
	UUID STRING NOT NULL,
	primary key (UUID)
  )
  CATALOG = 'SNOWFLAKE'
  EXTERNAL_VOLUME = 'transcom_tspanniceberg_extvol'
  BASE_LOCATION = 'transcom';


  describe table ICYTRANSCOME;

  select * from ICYTRANSCOME;

describe external volume transcom_tspanniceberg_extvol;

  CREATE OR REPLACE EXTERNAL VOLUME transcom_tspanniceberg_extvol
   STORAGE_LOCATIONS =
      (
         (
            NAME = 'se-tspann-apacheiceberg'
            STORAGE_PROVIDER = 'S3'
            STORAGE_BASE_URL = 's3://se-tspann-apacheiceberg/'
            STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::343434:role/se_tspann_iceberg_table_nifirole'
            STORAGE_AWS_EXTERNAL_ID = 'se_tspann_iceberg_table_external_id'
         )
      );

# https://docs.snowflake.com/en/user-guide/tables-iceberg-configure-external-volume-s3
