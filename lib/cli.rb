class CLI 
    

        def run
            system("clear")
            Scraper.load_scraper
            puts "List of the books"
            puts "-------------------------------"
          
            list_books
            menu

        end
        def exit_program
            puts "Thanks for visit"
            puts ""
            exit
        end

    def list_books
        Books.all.each.with_index(1) do |book,i|
        puts "#{i}. #{book.name}"
    end
    end

    def menu
        
            
        puts " "
        puts "For the books details choose the number"
        puts " "
        
              input = gets.chomp
        if !input.to_i.between?(1, Books.all.count)
            
            list_books
            menu
        else
            
         
            books= Books.all[input.to_i-1]
            display_book_details(books)
            
        end 
    end

    def display_book_details(book)
       
        Scraper.load_books_details(book)
        system("clear")
        puts "The Name of Book"
        puts "--------------------------"
        puts "#{book.name}"
        puts "--------------------------"
        puts "  "
        puts "The overview of book: #{book.overview}"
        puts "--------------------------------------------------"
        puts "@@@@@@@@@@@@@@@@-For More books-@@@@@@@@@@@@@@@@@@"
        puts " "
        display_again
         menu   
        list_books
        
    end

    
    def display_again
        
        puts "  "
        puts "      would you like to see more[Y/N]"
        puts " --(Y) for list of books and (N) for exit--"
        puts " "
        
        answer =gets.strip.downcase
        system("clear")
        if answer == "y"
            system("clear")
            list_books
            menu
           
        elsif answer == "n"
            system("clear")
            exit_program
           
        else
            
            puts ""
            puts "Try Again"
            puts ""
            system("clear")
            list_books
            
        end
    end
    end
    





