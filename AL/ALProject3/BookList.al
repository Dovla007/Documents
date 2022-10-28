page 50102 "Book List"
{
    PageType = List;
    SourceTable = Book;
    CardPageId = BookCard;

    layout
    {
        area(Content)
        {
            repeater(content)
            {
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

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}