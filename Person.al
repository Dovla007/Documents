table 50120 Person
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ID; Code[20])
        {
            CaptionML = Enu = 'ID'


        }
        field(2; Name; Text[20])
        {
            CaptionML = Enu = 'name'


        }
        field(3;'Last name'; Text[20])
        {
            CaptionML = Enu= 'Last name'
            
        }
        field(4;Birthday; Date)
        {
            CaptionML = Enu= 'Birthday'
            
        }
    }
    
    keys
    {
        key(PK;ID)
        {
            Clustered = true;
        }
    }
    
  
    
    trigger OnInsert()
    begin
        
    end;
    
    trigger OnModify()
    begin
        
    end;
    
    trigger OnDelete()
    begin
        
    end;
    
    trigger OnRename()
    begin
        
    end;
    
}