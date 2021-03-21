def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, books.year
  FROM books INNER JOIN series ON books.series_id = (SELECT series.id WHERE series.id = 1)
  GROUP BY books.year"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto
   FROM characters
   ORDER BY LENGTH(motto)
   DESC LIMIT(1)"
end


def select_value_and_count_of_most_prolific_species
  "SELECT species, COUNT(species) AS count_species
   FROM characters
   GROUP BY species
   ORDER BY COUNT(species)
   DESC LIMIT(1)"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name
  FROM authors, subgenres INNER JOIN series ON authors.id = series.author_id AND subgenres.id = series.subgenre_id
  GROUP BY authors.name"
end

def select_series_title_with_most_human_characters
  "SELECT series.title
   FROM series INNER JOIN characters ON series.author_id = characters.author_id
   GROUP by characters.species
   ORDER BY COUNT(characters.species)
   DESC LIMIT(1)"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, COUNT(*) AS book_counter
   FROM character_books JOIN characters ON characters.id = character_books.character_id
   GROUP BY characters.name
   ORDER BY book_counter DESC, characters.name ASC"
end
