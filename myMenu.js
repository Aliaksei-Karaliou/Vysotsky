var url = "menu.xml";
    var xmlDoc;
    var valid = false;  
    if(window.XMLHttpRequest) {  
        xmlDoc = new window.XMLHttpRequest();  
        xmlDoc.open("GET", url, false);  
        xmlDoc.send("");
        valid = true; 
    }
    else  
        if(window.ActiveXObject) {  
            xmlDoc = new ActiveXObject("Microsoft.XMLDOM");  
            xmlDoc.async = false;  
            xmlDoc.load(url);
            valid = true; 
        }
        else {  
            alert("Loading XML-menu is not supported by your browser");   
        };
    if (valid) {
        var item = xmlDoc.responseXML.getElementsByTagName('item');
        var menuJS='<ul id="menu">'
		for (i = 0; i < item.length; i++){
		    menuJS += '<li>';
		    var item1 = item[i].childNodes;
		    if (item1.length == 0)
		        menuJS += '<a href="' + item[i].attributes[0].value + '">' + item[i].attributes[1].value + '</a>';
		    else {
		        menuJS += item[i].attributes[0].value;
		        menuJS += '<ul>';
		        for (j = 1; j < item1.length; j++)
		            if (j % 2 == 1) {
		                var item2 = item1[j].childNodes;
		                menuJS += '<li>';
		                if (item2.length == 0)
		                    menuJS += '<a href="' + item1[j].attributes[0].value + '">' + item1[j].attributes[1].value + '</a>';
		                else {
		                    menuJS += item1[j].attributes[0].value;
		                    menuJS += '<ul>';
		                    for (k = 1; k < item2.length; k += 2)
		                        menuJS += '<li><a href="' + item2[k].attributes[0].value + '">' + item2[k].attributes[1].value + '</a></li>';
		                    menuJS += '</ul>';
		                }
		                menuJS += '</li>';
		            }
		        menuJS += '</ul>';
		    }
			menuJS+='</li>'
		}
		menuJS += '</ul>';
		var menuTag = document.getElementById("menuTable");
		menuTag.innerHTML = menuJS;
	}