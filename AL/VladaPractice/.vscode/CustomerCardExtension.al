pageextension 50101 CustomerCardExtension extends "Customer Card"
{
    layout
    {
        addlast(General)
        {

            field("Favorite Book"; Rec."Favorite Book No.")
            {
                ApplicationArea = All;

            }

        }
    }
}