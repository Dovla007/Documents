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
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;

                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;

                }
            }
            group(Details)
            {
                Caption = 'Details';
                field(Author; Rec.Author)
                {
                    ApplicationArea = All;

                }
                field(Hardcover; Rec.Hardcover)
                {
                    ApplicationArea = All;

                }
                field("Page Count"; Rec."Page Count")
                {
                    ApplicationArea = All;

                }


            }
        }
    }

}

