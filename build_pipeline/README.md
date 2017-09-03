# Build Pipeline Renderer

This isn't really a renderer... but it's used to choose
which renderer to use. If the source repository has a
`/input/html/.telegram_pipeline.json` file, that defines
the render pipeline.

Otherwise, Telegram points this container at the input
and the code in this container determines the render pipeline
which is written to `/output/pipeline.json`.


