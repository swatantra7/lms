# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  
  navigation.items do |primary|
    primary.item :book_stores, 'BookStore', librarians_books_path, highlights_on: %r(/book_stores/)
    primary.item :book_sanction, 'Sanctioned Books', librarians_book_sanctions_path, highlights_on: %r(/book_sanction/)
    primary.dom_class = 'nav navbar-nav'
    primary.dropdown = true
    primary.split = false
  end
end
