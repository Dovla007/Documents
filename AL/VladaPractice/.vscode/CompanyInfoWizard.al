page 50110 CompanzInfoWizard
{

    PageType = NavigatePage;
    SourceTable = "Company Information";
    CaptionML = ENU = 'Company Information';

    layout
    {
        area(Content)
        {
            group(StandardBanner)
            {
                Editable = false;
                Visible = TopBannerVisible AND (CurrentStep < 3);
                field(MediaRepositoryStandard; MediaResourcesStandard."Media Reference")
                {
                    Editable = false;
                    ShowCaption = false;
                }
            }
            group(FinishedBanner)
            {
                Editable = false;
                Visible = TopBannerVisible AND (CurrentStep = 3);
                field(MediaResourcesDone; MediaResourcesDone."Media Reference")
                {
                    Editable = false;
                    ShowCaption = false;
                }

            }
            group(Step1)
            {
                Visible = CurrentStep = 1;
                group(CompanyName)
                {
                    CaptionML = ENU = 'Company Name';
                    InstructionalTextML = ENU = 'Provide the name of your company';
                    field(Name; Rec.Name)
                    {
                        ApplicationArea = Basic;
                    }

                }
            }
            group(Step2)
            {
                Visible = CurrentStep = 2;
                group(EmailAddress)
                {
                    CaptionML = ENU = 'Email Address';
                    field("E-Mail"; Rec."E-Mail")
                    {
                        ApplicationArea = Basic;
                    }
                }
            }
            group(Step3)
            {
                Visible = CurrentStep = 3;
                group(AllDone)
                {
                    CaptionML = ENU = 'All done';
                    InstructionalTextML = ENU = 'Thank you! All information is now ready.';
                }
            }

        }
    }
    actions
    {
        area(Processing)
        {
            action(ActionBack)
            {
                ApplicationArea = Basic;
                CaptionML = ENU = 'Back';
                Enabled = ActionBackAllowed;
                Image = PreviousRecord;
                InFooterBar = true;
                trigger OnAction()
                begin
                    TakeStep(-1);
                end;
            }
            action(ActionNext)
            {
                ApplicationArea = Basic;
                CaptionML = ENU = 'Back';
                Enabled = ActionBackAllowed;
                Image = NextRecord;
                InFooterBar = true;
                trigger OnAction()
                begin
                    TakeStep(1);
                end;
            }
            action(ActionFinish)
            {
                ApplicationArea = Basic;
                CaptionML = ENU = 'Finish';
                Enabled = ActionFinishAllowed;
                Image = Approve;
                InFooterBar = true;
                trigger OnAction()
                begin
                    CurrPage.Close();
                end;

            }
        }

    }
    var
        CurrentStep: Integer;
        ActionBackAllowed: Boolean;
        ActionNext: Boolean;
        ActionFinishAllowed: Boolean;
        MediaRepositoryStandard: Record "Media Repository";
        MediaRepositoryDone: Record "Media Repository";
        MediaResourcesStandard: Record "Media Resources";
        MediaResourcesDone: Record "Media Resources";
        TopBannerVisible: Boolean;

    local procedure SetControls()
    begin
        ActionBackAllowed := CurrentStep > 1;
        ActionNext := CurrentStep < 3;
        ActionFinishAllowed := CurrentStep = 3;
    end;

    local procedure LoadTopBanners();
    begin
        if MediaRepositoryStandard.GET('AssistedSetup-NoText-400px.png', FORMAT(CURRENTCLIENTTYPE)) and
        MediaRepositoryDone.GET('AssistedSetupDone-NoText-400px.png', FORMAT(CURRENTCLIENTTYPE)) THEN
            if MediaResourcesStandard.GET(MediaRepositoryStandard."Media Resources Ref") and
            MediaResourcesDone.GET(MediaRepositoryDone."Media Resources Ref") THEN
                TopBannerVisible := MediaResourcesDone."Media Reference".HASVALUE;
    end;

    local procedure TakeStep(Step: Integer)
    begin
        CurrentStep += Step;
        SetControls();
    end;

    trigger OnOpenPage()
    begin
        CurrentStep := 1;
        SetControls();
    end;

    trigger onInit()
    begin
        LoadTopBanners;
    end;
}