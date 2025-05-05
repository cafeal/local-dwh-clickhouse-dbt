with
    genre_explode as (
        select *, genre
        from {{ source("imdb", "title_basics") }} array
        join splitByChar(',', genres) as genre
        left join {{ source("imdb", "title_ratings") }} ratings using (tconst)
    )

select
    genre,
    count(1) as count,
    avg(isAdult) as is_adult_ratio,
    sum(averageRating * numVotes) / sum(numVotes) as avg_rating,
    sum(numVotes) as total_votes
from genre_explode
where genre != ''
group by genre
