pageextension 50140 ItemCardExt extends "Item Card"
{
    actions
    {
        addfirst(Navigation_Item)
        {
            action(DownloadPicture)
            {
                Promoted = true;
                CaptionML = ENU = 'Downlaod Picture';
                Image = Picture;

                trigger OnAction()
                var
                    DownloadMgt: Codeunit HttpDownloadMgt;
                    TempBlob: Codeunit "Temp blob";
                    InStr: InStream;

                begin
                    DownloadMgt.DownloadPicture('http://vjeko.com/demo/bicycle.jpg', TempBlob);
                    TempBlob.CreateInStream(InStr);
                    Rec.Picture.ImportStream(InStr, 'Image');
                    CurrPage.Update(true);
                end;
            }

        }
    }
}