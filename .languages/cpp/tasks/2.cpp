#include <iostream>
#include <string>
#include <utility>
#include <vector>

class Book {
    std::string author_surname_;
    std::string author_initials_;
    std::string book_name_;

    uint16_t book_year{};
public:
    Book(std::istream& surname, std::istream& initials, std::istream& book_name, std::istream& year)
    {
        std::cout << "\nAuthor surname: ";  std::getline(surname, author_surname_);
        std::cout << "Initials: ";          std::getline(initials, author_initials_);
        std::cout << "Book name: ";         std::getline(book_name, book_name_);
        std::cout << "Year: ";              year >> book_year;
    }

    // author_surname_
    std::string getAuthorSurname() const { return author_surname_; }

    // author_initials_
    std::string getAuthorInitials() const { return author_initials_; }

    // book_name_
    std::string getName() const { return book_name_; }

    // book_year
    uint16_t getYear() const { return book_year; }
};

int main()
{
    setlocale(LC_ALL, ".1251");
    uint32_t book_count;

    std::cout << "Book count: ";
    std::cin >> book_count;

    std::vector<Book*> books = { };

    for (uint32_t i = 0; i < book_count; i++)
        books.emplace_back(new Book(std::cin, std::cin, std::cin, std::cin));

    for (auto & x : books)
        if (x->getYear() >= 1990 && x->getName().find("информатика") != std::string::npos)
            printf("\nFound:\nAuthor: %s %s\nBook: %s\nYear: %d",
                   x->getAuthorSurname().c_str(), x->getAuthorInitials().c_str(), x->getName().c_str(), x->getYear()
            );

    return 0;
}