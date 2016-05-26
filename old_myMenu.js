var url = "old_menu.xml";
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
        var item = xmlDoc.responseXML.getElementsByTagName('head');
        var menuJS='<ul id="menu">'
		for (i = 0; i < item.length; i++){
		    menuJS += '<li>';
		    var item1 = item[i].childNodes;
			if (item[i].attributes.length>0)
				menuJS += '<a href="' + item[i].attributes[0].value + '">' + item[i].firstChild.nodeValue + '</a>';		  
			else 	menuJS +=item[i].firstChild.nodeValue;
			menuJS+='</li>'
		}
		menuJS += '</ul>';
		var menuTag = document.getElementById("menuTable");
		menuTag.innerHTML = menuJS;
	}