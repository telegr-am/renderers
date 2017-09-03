# Telegram Renderers

[Telegram](https://telegr.am) is a static site hosting
service that supports arbitrary rendering pipelines.

The pipelines are composed of "Renderers" which are
expressed as Docker images.

Each Renderer is expected to take the site at `/input/main`
and output static site HTML to `/output/html`

# License

MIT

# Contribution

We encourage pull requests.

With all pull requests, you:

* Certify that the work is your original work
* Add your name and the date of the PR to the `Contributors.md` file
* You grant all work in the pull requests under the same MIT license

# Technical stuff

The following environment variables are passed to
the container:

* `TG_USER_LOCALE` -- the locale of the user
* `TG_USER_TIMEZONE` -- the time zone of the user
* `TG_USER_SITE` -- the domain of the site... e.g. `blog.goodstuff.im`

The `/output` directory is readable

The `/input/pipeline.json` file contains pipeline information.

If your renderer leaves an `/output/repos.json` file of the format:

```
{
 'version': 1,
 'repos': [{'git_url': 'git:xxxxx', 'dest': 'foo'}]
 }
```

Telegram will attempt to fetch the named repos and place them
in `/input/<dest>` and then re-run the render phase. This allows
you to include private repositories that you have the credentials
to access to be copied into the render job.

