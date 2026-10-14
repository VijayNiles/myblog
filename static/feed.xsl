<?xml version="1.0" encoding="utf-8"?>
<!--
  Human-friendly rendering for the RSS feed.
  Browsers apply this XSL when a person opens the .xml URL, showing a readable
  page instead of raw XML. Feed readers/aggregators ignore it and consume the
  raw RSS. Referenced via the <?xml-stylesheet?> instruction in rss.xml.
-->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:atom="http://www.w3.org/2005/Atom"
  xmlns:content="http://purl.org/rss/1.0/modules/content/">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/rss">
    <html lang="en">
      <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title><xsl:value-of select="channel/title"/> &#8212; RSS feed</title>
        <link rel="preconnect" href="https://fonts.googleapis.com"/>
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="crossorigin"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&amp;display=swap"/>
        <style>
          :root {
            --navy: #0f172a;
            --panel: #1e293b;
            --text: #f8fafc;
            --muted: #aab2c3;
            --accent: #ff9900;
            --border: #334155;
          }
          * { box-sizing: border-box; }
          body {
            margin: 0;
            background: var(--navy);
            color: var(--text);
            font-family: Montserrat, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            line-height: 1.6;
          }
          .wrap { max-width: 720px; margin: 0 auto; padding: 2.5rem 1.25rem 4rem; }
          .banner {
            background: var(--panel);
            border: 1px solid var(--border);
            border-left: 4px solid var(--accent);
            border-radius: 8px;
            padding: 1.25rem 1.5rem;
            margin-bottom: 2.5rem;
          }
          .banner h2 { margin: 0 0 0.5rem; font-size: 1.1rem; color: var(--accent); }
          .banner p { margin: 0; color: var(--muted); font-size: 0.95rem; }
          .banner code {
            background: var(--navy);
            border: 1px solid var(--border);
            border-radius: 4px;
            padding: 0.1rem 0.4rem;
            font-size: 0.85rem;
          }
          h1 { font-size: 2rem; font-weight: 700; margin: 0 0 0.25rem; }
          .desc { color: var(--muted); margin: 0 0 2rem; }
          .item {
            background: var(--panel);
            border: 1px solid var(--border);
            border-radius: 8px;
            padding: 1.25rem 1.5rem;
            margin-bottom: 1rem;
          }
          .item h3 { margin: 0 0 0.35rem; font-size: 1.25rem; font-weight: 600; }
          .item a { color: var(--text); text-decoration: none; }
          .item a:hover { color: var(--accent); }
          .item .date { color: var(--muted); font-size: 0.85rem; margin: 0 0 0.75rem; }
          .footer { margin-top: 2.5rem; color: var(--muted); font-size: 0.85rem; text-align: center; }
          .footer a { color: var(--accent); text-decoration: none; }
        </style>
      </head>
      <body>
        <div class="wrap">
          <div class="banner">
            <h2>This is an RSS feed</h2>
            <p>
              It is meant to be read in a feed reader, not a browser. Copy this
              page's URL into your reader (e.g. Feedly, NetNewsWire) to subscribe
              and get new posts automatically. You are seeing a friendly preview
              below.
            </p>
          </div>

          <h1><xsl:value-of select="channel/title"/></h1>
          <p class="desc"><xsl:value-of select="channel/description"/></p>

          <xsl:for-each select="channel/item">
            <div class="item">
              <h3>
                <a href="{link}"><xsl:value-of select="title"/></a>
              </h3>
              <p class="date"><xsl:value-of select="pubDate"/></p>
            </div>
          </xsl:for-each>

          <p class="footer">
            Back to <a href="{channel/link}"><xsl:value-of select="channel/title"/></a>
          </p>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
