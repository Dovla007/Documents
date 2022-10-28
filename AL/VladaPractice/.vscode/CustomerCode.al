codeunit 50101 MyNewCodeunit
{
    [EventSubscriber(ObjectType::Table, 18, 'OnAfterInsertEvent', '', true, true)]
    local procedure CustomerOnAfterInsert(var Rec: Record Customer; RunTrigger: Boolean);
    begin
        Message('Procedura radi kako treba');
        Message('Nova poruka sa GitHub-a')
    end;

}
