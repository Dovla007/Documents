codeunit 50140 HttpDownloadMgt
{
    procedure DownloadPicture(Url: Text; var TempBlob: Codeunit "Temp blob")
    var
        Client: HttpClient;
        Response: HttpResponseMessage;
        InStr: InStream;
        OutStr: OutStream;
    begin
        Client.Get(Url, Response);
        Response.Content.ReadAs(InStr);
        TempBlob.CreateOutStream(OutStr, TextEncoding::Windows);
        CopyStream(OutStr, InStr);
    end;
}