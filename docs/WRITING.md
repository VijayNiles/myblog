# Writing & Publishing Posts

The frictionless workflow for writing in Obsidian and publishing to the live blog.

## One-time setup (Obsidian)

1. **Install Obsidian** — download from [obsidian.md](https://obsidian.md) (free for personal use).
2. **Open the content folder as a vault:**
   - On the Obsidian welcome screen, choose **"Open folder as vault."**
   - Select the `content/` folder inside this repo. (Opening just `content/` keeps the
     editor focused on writing — you won't see the site's code.)
3. **Flip two settings so Obsidian saves Hugo-friendly files:**
   - **Settings → Files & Links → "Use [[Wikilinks]]" → turn OFF.** This makes Obsidian
     write standard Markdown links (`![](image.png)`) that Hugo understands, instead of
     Obsidian-only `[[wikilink]]` syntax.
   - **Settings → Files & Links → "Default location for new attachments" → "Same folder as
     current file."** This drops images right next to the post you're writing (required for
     Hugo page bundles).

That's it. These settings persist.

## Important: run all terminal commands from the project root

`npx hugo ...`, `npm run dev`, and `git` commands must be run from the repo's root folder
(the one containing `config.yml`). The pinned Hugo lives in this project's `node_modules/`,
and Hugo resolves paths relative to the project root. If a command behaves oddly, check your
location with `pwd` and `cd` into the project first.

## Writing a new post (the everyday flow)

1. **Create the post** (terminal, from the project root):
   ```bash
   npx hugo new posts/my-post-title/index.md
   ```
   This scaffolds a folder `content/posts/my-post-title/` with an `index.md` already
   containing the date, title, and a tags placeholder.

2. **Open it in Obsidian** — it appears automatically under `posts/` in your vault. Click it
   and start writing.

3. **Add formatting as you go:**
   - **Bold:** `**like this**`   ·   *Italic:* `*like this*`
   - **Headings:** `## Section`, `### Subsection`
   - **Links:** `[text](https://example.com)`
   - **Inline code:** wrap in single backticks, e.g. `` `npm run dev` ``.
   - **Images:** drag-and-drop (or paste) into the editor. Obsidian saves the image into the
     post's folder and inserts the link. **Add alt text** between the brackets for
     accessibility/SEO — Obsidian leaves it blank, so change `![](panda.jpeg)` to
     `![A panda cub climbing a tree](panda.jpeg)`.
   - **Code blocks:** fence with a language for syntax highlighting + a copy button:
     ~~~
     ```python
     def hello():
         print("hi")
     ```
     ~~~
     Common languages: `python`, `javascript`, `go`, `bash`, `yaml`, `json`, `sql`.
   - **YouTube video:** `{{< youtube VIDEO_ID >}}` (the ID is the part after `watch?v=` in
     the URL).
   - **Blockquote:** start a line with `> `.

4. **Set tags** in the front matter at the top, e.g. `tags = ['AI', 'AWS']`.

5. **Preview locally** (terminal, from the project root):
   ```bash
   npm run dev
   ```
   Open <http://localhost:1313> to see the post with full site branding. It hot-reloads as
   you save in Obsidian.

6. **Publish:**
   - Change `draft = true` to `draft = false` in the front matter.
   - Commit and push (from the project root):
     ```bash
     git add content/posts/my-post-title
     git commit -m "post: my post title"
     git push
     ```
   - GitHub Actions builds and deploys automatically. Live in ~2 minutes.

## Reference template

`content/posts/_template/` is a draft post demonstrating every formatting option (headings,
bold, lists, images, code blocks, YouTube embed, blockquotes). It never publishes (it's a
draft). Copy it when you want a ready-made starting point.

## Notes

- **Page bundles:** each post is a folder with `index.md` and its images. Keep this structure
  — it's what makes drag-and-drop images work.
- **Drafts** (`draft = true`) show in `npm run dev` but are NOT published to the live site.
- **Future-dated posts** won't publish until that date (`buildFuture: false` in config).
- The `.obsidian/` folder Obsidian creates is git-ignored — don't worry about it.
