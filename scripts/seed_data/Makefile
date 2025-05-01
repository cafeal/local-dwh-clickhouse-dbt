.PHONY: all
all: ingest

ingest: name.basics.tsv.gz title.ratings.tsv.gz title.basics.tsv.gz title.episode.tsv.gz
	clickhouse client ingest.sql

name.basics.tsv.gz:
	wget https://datasets.imdbws.com/name.basics.tsv.gz

title.ratings.tsv.gz:
	wget https://datasets.imdbws.com/title.ratings.tsv.gz

title.basics.tsv.gz:
	wget https://datasets.imdbws.com/title.basics.tsv.gz

title.episode.tsv.gz:
	wget https://datasets.imdbws.com/title.episode.tsv.gz
