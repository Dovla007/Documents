page 50101 BookCard
{
    PageType = Card;
    SourceTable = Book;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; "No.")
                {
                    ApplicationArea = All;

                }
                field(Title; Title)
                {
                    ApplicationArea = All;

                }
            }
            group(Details)
            {
                Caption = 'Details';
                field(Author; Author)
                {
                    ApplicationArea = All;

                }
                field(Hardcover; Hardcover)
                {
                    ApplicationArea = All;

                }
                field("Page Count"; "Page Count")
                {
                    ApplicationArea = All;

                }


            }
        }
    }

}

