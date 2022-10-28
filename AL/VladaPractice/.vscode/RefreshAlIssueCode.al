codeunit 50100 RefreshALIssueCode
{
    procedure Refresh()
    var
        AlIssue: Record AlIssue;
        HttpClient: HttpClient;
        HttpResponseMessage: HttpResponseMessage;
        JsonToken: JsonToken;
        JsonValue: JsonValue;
        JsonObject: JsonObject;
        JsonArray: JsonArray;
        JsontText: Text;
        Integer: Integer;
    begin
        AlIssue.DeleteAll;

        //Web service call
        HttpClient.DefaultRequestHeaders.Add('User-Agent', 'Dynamics 365');
        IF not HttpClient.Get('https://api.github.com/repos/Microsoft/AL/issues', HttpResponseMessage) then
            Error('The call to the web service failed');

        If not HttpResponseMessage.IsSuccessStatusCode then
            Error('The web service returned an error message:\\' +
            'Status code: %1' +
            'Description: %2',
            HttpResponseMessage.HttpStatusCode,
            HttpResponseMessage.ReasonPhrase);

        HttpResponseMessage.Content.ReadAs(JsontText);

        // Process JSON response
        IF not JsonArray.ReadFrom(JsontText) then
            Error('Invalid response, expected an JSON array as root object');

        foreach JsonToken in JsonArray do begin
            JsonObject := JsonToken.AsObject;

            AlIssue.Init;
            IF not JsonObject.Get('id', JsonToken) then
                Error('Could not find a token with key %1');

            AlIssue.id := JsonToken.AsValue.AsInteger();

            AlIssue.number := GetJsonToken(JsonObject, 'number').AsValue.AsInteger;
            AlIssue.title := GetJsonToken(JsonObject, 'title').AsValue.AsText;
            AlIssue.created_at := GetJsonToken(JsonObject, 'created_at').AsValue.AsDateTime;
            AlIssue.State := GetJsonToken(JsonObject, 'state').AsValue.AsText;
            AlIssue.html_url := GetJsonToken(JsonObject, 'html_url').AsValue.AsText;
            AlIssue.user := SelectJsonToken(JsonObject, '$.user.login').AsValue.AsText;
            AlIssue.Insert;
        end;
    end;

    procedure GetJsonToken(JsonObject: JsonObject; TokenKey: Text) JsonToken: JsonToken
    var
        myInt: Integer;
    begin
        If not JsonObject.Get(TokenKey, JsonToken) then
            Error('Could not find a token with key %1', TokenKey);
    end;

    procedure SelectJsonToken(JsonObject: JsonObject; Path: Text) JsonToken: JsonToken
    var
        myInt: Integer;
    begin
        If not JsonObject.SelectToken(Path, JsonToken) then
            Error('Could not find a token with key %1', Path);
    end;

}
