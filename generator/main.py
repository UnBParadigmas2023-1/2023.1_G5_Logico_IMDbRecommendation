import csv
import pathlib
import itertools


DATA_PATH = pathlib.Path(__file__).parent / 'data.csv'
OUTPUT_PATH = pathlib.Path(__file__).parent.parent / 'src' / 'database' / 'data.pl'

# List of (field name, field parser) tuples
MOVIE_FIELDS = [
    ('Series_Title', str),
    ('Released_Year', int),
    ('Runtime', lambda x: int(x.split()[0])),
    ('Genre', lambda x: [*map(str.strip, x.split(','))]),
    ('IMDB_Rating', float),
    ('Director', str),
    ('Star1', str),
    ('Star2', str),
    ('Star3', str),
    ('Star4', str),
    ('Gross', lambda x: int(x.replace(',', '') or -1)),
]


movies = []
with open(DATA_PATH, 'r') as f:
    reader = csv.DictReader(f)
    assert reader.fieldnames, 'Missing CSV header'

    missing_fields = set(name for name, _ in MOVIE_FIELDS) - set(reader.fieldnames)
    assert not missing_fields, f'Missing required fields: {missing_fields}'

    for row in reader:
        try:
            movies.append({
                name: parser(row[name])
                for name, parser in MOVIE_FIELDS
            })
        except Exception as e:
            print(f'Failed to parse row: {row}.\n  -> Error: {e}')


OUTPUT_PATH.parent.mkdir(parents=True, exist_ok=True)
with open(OUTPUT_PATH, 'w') as f:
    f.write('% Series_Title, Released_Year, Runtime, Genre, IMDB_Rating, Director, Star, Gross\n')
    for movie in movies:
        stars = [movie[f'Star{i}'] for i in range(1, 5) if movie[f'Star{i}'].strip()] or ['Desconhecido']
        genres = movie['Genre'] or ['Desconhecido']

        for genre, star in itertools.product(genres, stars):
            f.write(f'movie({", ".join(map(repr, [movie["Series_Title"], movie["Released_Year"], movie["Runtime"], genre, movie["IMDB_Rating"], movie["Director"], star, movie["Gross"]]))}).\n')
