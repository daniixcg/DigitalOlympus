<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:value-of select="rss/channel/title" />
                </title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        margin: 20px;
                        background-color: #f4f4f9;
                        color: #333;
                    }
                    h1 {
                        background-color: #2B3035;
                        color: white;
                        padding: 10px;
                        border-radius: 5px;
                        text-align: center;
                    }
                    p {
                        margin: 10px 0;
                        line-height: 1.6;
                    }
                    ul {
                        list-style-type: none;
                        padding: 0;
                    }
                    li {
                        background: white;
                        margin: 10px 0;
                        padding: 15px;
                        border: 1px solid #ddd;
                        border-radius: 5px;
                        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                    }
                    li:hover {
                        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                    }
                    a {
                        color: #007acc;
                        text-decoration: none;
                        font-weight: bold;
                    }
                    a:hover {
                        text-decoration: underline;
                    }
                    small {
                        display: block;
                        margin-top: 5px;
                        color: #666;
                        font-size: 0.9em;
                    }
                </style>
            </head>
            <body>
                <h1>
                    <xsl:value-of select="rss/channel/title" />
                </h1>
                <p>
                    <xsl:value-of select="rss/channel/description" />
                </p>
                <ul>
                    <xsl:for-each select="rss/channel/item">
                        <li>
                            <a href="{link}" target="_blank">
                                <xsl:value-of select="title" />
                            </a>
                            <p>
                                <xsl:value-of select="description" />
                            </p>
                            <small>
                                <xsl:value-of select="pubDate" />
                            </small>
                        </li>
                    </xsl:for-each>
                </ul>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
