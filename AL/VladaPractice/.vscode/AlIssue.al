table 50120 AlIssue
{
    fields
    {
        field(1; id; Integer)
        {
            CaptionML = ENU = 'ID';
        }
        field(2; number; Integer)
        {
            CaptionML = ENU = 'Number';
        }
        field(3; title; Text[250])
        {
            CaptionML = ENU = 'Title';
        }
        field(4; created_at; DateTime)
        {
            CaptionML = ENU = 'Created at';
        }
        field(5; user; Text[50])
        {
            CaptionML = ENU = 'User';

        }
        field(6; State; Text[30])
        {
            CaptionML = ENU = 'State';
        }
        field(7; html_url; Text[250])
        {
            CaptionML = ENU = 'URL';
        }
    }
    keys
    {
        key(PK; id)
        {
            Clustered = true;
        }
    }
    procedure RefreshIssues()
    var
        RefreshAlIssues: Codeunit RefreshALIssueCode;
    begin
        RefreshAlIssues.Refresh();
    end;
}

