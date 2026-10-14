+++
date = '{{ .Date }}'
draft = true
title = '{{ replace .File.ContentBaseName "-" " " | title }}'
tags = []
+++

Write your post here. A few reminders:

- Set `draft = false` above when you're ready to publish.
- Add tags like `tags = ['AI', 'AWS']`.
- Drag images into this folder; reference them as `![alt text](image.png)`.
- Embed a YouTube video with the shortcode: `{{</* youtube VIDEO_ID */>}}`
