var button = document.createElement("BUTTON");
button.appendChild(document.createTextNode("Click"));
button.onclick = button_click;
document.body.appendChild(button);

function button_click(){
    var allTags = document.getElementsByTagName('*');
    var div = document.createElement("div");
    var table = document.createElement("table");
    table.style.border = ("border", "1px solid #000");
    table.rules = "all";
    for (i = 0; i < allTags.length; i++) {
        var tr = document.createElement("tr");
        var tag = document.createElement("td");
        tag.innerHTML += allTags[i].tagName.toLowerCase();;
        tr.appendChild(tag);
        var attribute = document.createElement("td");
        if (allTags[i].attributes.length > 0) {
            tr.style.background = "yellow";
            var attr=allTags[i].attributes;
            for (j = 0; j <attr.length; j++) {
                attribute.innerHTML += attr[j].name+" = "+attr[j].value+"<br>";
            }
        }
        else tr.style.background = "green";
        tr.appendChild(attribute);
        table.appendChild(tr);
    }
    div.appendChild(table);
    document.body.appendChild(div);
}