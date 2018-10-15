<!--#include virtual="/aspJSON1.17.asp" -->

<%


Set oJSON = New aspJSON
With oJSON.data
   
        .Add 0, oJSON.Collection()                  'Create object
        With .item(0)
            .Add "firstName", "John"
            .Add "age", 41
        End With
        .Add 1, oJSON.Collection()
        With .item(1)
            .Add "firstName", "Suzan"
            .Add "age", 38
        End With
        .Add 2, oJSON.Collection()
        With .item(2)
            .Add "firstName", "John Jr."
            .Add "age", 2.5
        End With
   
End With
Response.Write oJSON.JSONoutput()                   'Return json string
   

       
%>
