<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Autocomplete - Default functionality</title>
    <script type="text/javascript" src="js/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="js/jquery-ui.css" />
    <script type="text/javascript" src="js/jquery-ui.js"></script>
  <script type="text/javascript">
      $(function () {
          $("#tags").autocomplete({
              source: function (request, response) {
                  $.ajax({
                      url: "DataToJson.asp",
                      data: { "find": $("#tags").val() },
                      dataType: "json",
                      type: "GET",
                      contentType: "application/json; charset=utf-8",
                      dataFilter: function (data) { return data; },
                      success: function (data) {
                          response(data);
                      },
                      error: function (XMLHttpRequest, textStatus, errorThrown) {
                          alert(textStatus);
                      }
                  });
              },
              minLength: 1,
              select: function (event, ui) {
                  $("#tags").val(ui.item.firstName);
                  $("#tags2").val(ui.item.age);
                  return false;
              },
              autoFill: true,
              mustMatch: true
          })
           .data("ui-autocomplete")._renderItem = function (ul, item) {
                           return $("<li>")
                               .data("ui-autocomplete-item", item)
                               .append("<a> " + item.firstName + " " + item.age + "</a>")
                               .appendTo(ul);
                       };
      });

  </script>
</head>
<body>
 
<div class="ui-widget">
  <label for="tags">Tags: </label>
  <input id="tags" name="f_test3">
      <input id="tags2" name="f_test2" >
</div>
 
 
</body>
</html>