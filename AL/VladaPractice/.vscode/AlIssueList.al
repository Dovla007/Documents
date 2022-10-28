page 50115 AlIssueList
{
    PageType = List;
    Editable = false;
    CaptionML = ENU = 'Al Issues';
    SourceTable = AlIssue;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Number; number) { }
                field(title; title) { }
                field(created_at; created_at) { }
                field(user; user) { }
                field(State; State) { }
                field(html_url; html_url)
                {
                    ExtendedDatatype = URL;
                }
            }
        }

    }

    actions
    {
        area(Processing)
        {
            action(RefreshAlIssueList)
            {
                CaptionML = ENU = 'Refresh Issues';
                Promoted = true;
                PromotedCategory = Process;
                Image = RefreshLines;
                trigger OnAction()
                begin
                    RefreshIssues();
                    CurrPage.Update();
                    if FindFirst then;
                end;
            }
        }
    }
}