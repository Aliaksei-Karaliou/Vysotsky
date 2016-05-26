<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version = "1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:math="http://exslt.org/math" exclude-result-prefixes="math">

    <xsl:template match="/">
        <html lang="ru">
        <head>
            <link rel="stylesheet" href="style.css"/>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
            <title>Table</title>
        </head>  
        <body>
          <a href="index.html">
            <img src="images/main.png" id="title-picture" alt="Title" Title="На главную"/>
          </a>
          <table>
            <tr>
              <td id="menuTable">
                <script src="myMenu.js"/>
              </td>
              <td id="text">
            1. Сортировка по длительности (возрастание) + 4.Вставки нумерации
            <table border="1" rules="all" bgcolor="yellow">
                <tr>
					<th align="center">id</th>
					<th align="center">Название</th>
		            <th align="center">Год</th>
                    <th align="center">Длительность</th>
	            </tr>
	            <xsl:for-each select="//song">
                <xsl:sort select="minutes" order="ascending" data-type="number"/>
	                <tr>
                       	<td><xsl:value-of select="position()"/></td>
						<td><xsl:value-of select="@title"/></td>  
                        <td><xsl:value-of select="year"/></td>
                        <td><xsl:value-of select="minutes"/></td>  
	                </tr>
                </xsl:for-each>
            </table>
			<br/>
			1. Сортировка по году (убывание)
            <table border="1" rules="all" bgcolor="green">
                <tr>
					<th align="center">Название</th>
		            <th align="center">Год</th>
                    <th align="center">Длительность</th>
	            </tr>
	            <xsl:for-each select="//song">
                <xsl:sort select="year" order="descending" data-type="number"/>
	                <tr>
						<td><xsl:value-of select="@title"/></td>  
                        <td><xsl:value-of select="year"/></td>
                        <td><xsl:value-of select="minutes"/></td>  
	                </tr>
                </xsl:for-each>
            </table>
            <br/>

            2. Отбор по значению элемента (Только 1968 год)
            <table border="1" rules="all" bgcolor="blue">
                <tr>
					<th align="center">Название</th>
			        <th align="center">Год</th>
                    <th align="center">Длительность</th>
	            </tr>
	            <xsl:for-each select="//song[year='1968']">
	                <tr>
						<td><xsl:value-of select="@title"/></td>  
                        <td><xsl:value-of select="year"/></td>
                        <td><xsl:value-of select="minutes"/></td>  
	                </tr>
                </xsl:for-each>   
            </table>
            <br/>

            2. Отбор по значению атрибута (Только Лирическая)
            <table border="1" rules="all" bgcolor="red">
                <tr>
					<th align="center">Название</th>
			        <th align="center">Год</th>
                    <th align="center">Длительность</th>
	            </tr>
	            <xsl:for-each select="//song[@title='Лирическая']">
	                <tr>
                        <td><xsl:value-of select="@title"/></td>  
                        <td><xsl:value-of select="year"/></td>
                        <td><xsl:value-of select="minutes"/></td>    
	                </tr>
                </xsl:for-each>   
            </table>
            <br/>

            3. Подстановки константной строки в случае выполнения условия
            <table border="1" rules="all" bgcolor="orange">
                <tr>
					<th align="center">Строка</th>
					<th align="center">Название</th>
					<th align="center">Год</th>
                    <th align="center">Длительность</th>
	           </tr>
	           <xsl:for-each select="//song">
	           <tr>
	               <xsl:if test="year='1968'">
						<td>1968 год</td>
	               </xsl:if>
	               <xsl:if test="not(year='1968')">
						<td>не 1968 год</td>
	               </xsl:if>
						<td><xsl:value-of select="@title"/></td>  
						<td><xsl:value-of select="year"/></td>
						<td><xsl:value-of select="minutes"/></td>     
              </tr>
	          </xsl:for-each>
	        </table> 
            <br/>
			В минутах:<br/>
            5. Суммарная длительность              = <xsl:value-of select="sum(//minutes)"/><br/>
            6. Длительность самой длинной песни   = <xsl:value-of select="math:max(//minutes)"/><br/>
            6. Длительность самой короткой песни    = <xsl:value-of select="math:min(//minutes)"/><br/>
            7. Средняя длительность                = <xsl:value-of select="sum(//minutes) div count(//minutes)"/> <br/>
			</td></tr></table>
        </body>  
        </html>
    </xsl:template>
</xsl:stylesheet>