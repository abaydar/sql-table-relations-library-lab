def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, books.year
    FROM books
    INNER JOIN series
    ON books.series_id = series.id
    WHERE series.id = 1
    ORDER BY books.year ASC;"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto FROM characters
    ORDER BY LENGTH(motto) DESC LIMIT 1;"
end


def select_value_and_count_of_most_prolific_species
  "SELECT species, COUNT(species) AS num 
    FROM characters
    GROUP BY SPECIES
    ORDER BY num DESC LIMIT 1;"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name
    FROM authors
    LEFT OUTER JOIN series ON series.author_id = authors.id
    LEFT OUTER JOIN subgenres ON series.subgenre_id = subgenres.id;"
end

def select_series_title_with_most_human_characters
  "SELECT series.title
    FROM series
    INNER JOIN characters ON series.author_id = characters.author_id
    WHERE characters.species = 'human'
    LIMIT 1;"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, COUNT(character_books.book_id) AS book_count
    FROM characters
    INNER JOIN character_books ON characters.id = character_books.character_id
    GROUP BY characters.name
    ORDER BY book_count DESC, characters.name;"
end
