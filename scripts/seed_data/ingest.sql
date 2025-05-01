CREATE DATABASE IF NOT EXISTS imdb;

CREATE OR REPLACE TABLE imdb.name_basics
(
    `nconst` String,
    `primaryName` String,
    `birthYear` Int16,
    `deathYear` Int16,
    `primaryProfession` String,
    `knownForTitles` String
)
ENGINE = MergeTree
ORDER BY nconst;

INSERT INTO imdb.name_basics
FROM INFILE 'name.basics.tsv.gz'
COMPRESSION 'gzip'
FORMAT TabSeparated;

CREATE OR REPLACE TABLE imdb.title_basics
(
    `tconst` String,
    `titleType` String,
    `primaryTitle` String,
    `originalTitle` String,
    `isAdult` Int8,
    `startYear` Int16,
    `endYear` Int16,
    `runtimeMinutes` Int16,
    `genres` String
)
ENGINE = MergeTree
ORDER BY tconst;

INSERT INTO imdb.title_basics
FROM INFILE 'title.basics.tsv.gz'
COMPRESSION 'gzip'
FORMAT TabSeparated;

CREATE OR REPLACE TABLE imdb.title_episode
(
    `tconst` String,
    `parentTconst` String,
    `seasonNumber` Int16,
    `episodeNumber` Int16
)
ENGINE = MergeTree
ORDER BY tconst;

INSERT INTO imdb.title_episode
FROM INFILE 'title.episode.tsv.gz'
COMPRESSION 'gzip'
FORMAT TabSeparated;

CREATE OR REPLACE TABLE imdb.title_ratings
(
    `tconst` String,
    `averageRating` Float32,
    `numVotes` Int32
)                                      
ENGINE = MergeTree
ORDER BY tconst;

INSERT INTO imdb.title_ratings
FROM INFILE 'title.ratings.tsv.gz'
COMPRESSION 'gzip'
FORMAT TabSeparated
;
